
class NotificationsController < ApplicationController

  # before_action :require_signed_in!

  def index
    @notifications = Notification.all
    render :index
  end


  def show
    @notification = Notification.find(params[:id])
    @notification.update(is_read: true)
    redirect_to @notification.url
  end

end
