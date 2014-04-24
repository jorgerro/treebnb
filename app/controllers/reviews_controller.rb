
class ReviewsController < ApplicationController

  before_action :require_signed_in!
  # after_action :create_notification, only: :create

  def create
    @review = Review.new(review_params)
    if @review.save
      create_notification(@review)
      redirect_to_review_subject(@review)
    else
      flash.now[:errors] = @review.errors.full_messages
      redirect_to_review_subject(@review)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to_review_subject(@review)
  end

  def redirect_to_review_subject(review)
    if review.reviewable_type == "Room"
      redirect_to Room.find(review.reviewable_id)
    else
      redirect_to User.find(review.reviewable_id)
    end
  end

  def create_notification(review)
    if review.reviewable_type == "Room"
      @room = Room.find(review.reviewable_id)
      interested_person = @room.owner
      event_id = 2
          # notify user that someone has reviewed their property
    else
      @user = User.find(review.reviewable_id)
      interested_person = @user
      event_id = 1
          # notify user that someone has reviewed their profile
    end

    Notification.create!({ event_id: event_id, user_id: interested_person.id,
      status: "UNREAD", notifiable_id: review.id, notifiable_type: "Review"})
  end

  private
  def review_params
    params.require(:review).permit(:reviewable_id, :reviewable_type,
    :body, :author_id)
  end

end
