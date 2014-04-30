
class MessageThreadsController < ApplicationController

  before_action :require_signed_in!

  def show
    @thread = MessageThread.find(params[:id])
    if current_user.id == @thread.user_one_id || current_user.id == @thread.user_two_id
      @messages = @thread.messages.order('created_at DESC')
      @user1 = @thread.user_one
      @user2 = @thread.user_two
      render :show
    end
  end




end
