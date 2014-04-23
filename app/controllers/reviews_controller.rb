
class ReviewsController < ApplicationController

  before_action :require_signed_in!

  def create
    @review = Review.new(review_params)
    if @review.save
      if @review.reviewable_type == "Room"
        redirect_to Room.find(@review.reviewable_id)
      else
        redirect_to User.find(@review.reviewable_id)
      end
    else
      flash.now[:errors] = @review.errors.full_messages
      if @review.reviewable_type == "Room"
        redirect_to Room.find(@review.reviewable_id)
      else
        redirect_to User.find(@review.reviewable_id)
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    if @review.reviewable_type == "Room"
      redirect_to Room.find(@review.reviewable_id)
    else
      redirect_to User.find(@review.reviewable_id)
    end
  end

  private
  def review_params
    params.require(:review).permit(:reviewable_id, :reviewable_type,
    :body, :author_id)
  end

end
