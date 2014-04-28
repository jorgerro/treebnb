
class NotificationsController < ApplicationController

  before_action :require_signed_in!

  def index
    @notifications = Notification.where(user_id: current_user.id)
                                 .order("is_read")
    render :index
  end


  def show
    @notification = Notification.find(params[:id])
    @notification.update(is_read: true)
    redirect_to @notification.url
  end

end
