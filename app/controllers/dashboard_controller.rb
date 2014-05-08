
class DashboardController < ApplicationController

  before_action :require_signed_in!

  def root
    @user = User.find(params[:user_id])
    @threads = @user.threads.includes(messages: :sender).where("messages.sender_id != :id", id: current_user.id).all
    @messages = current_user.received_messages.unread.includes(:sender).all
    render :root
  end

end
