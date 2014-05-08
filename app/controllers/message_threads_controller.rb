
class MessageThreadsController < ApplicationController

  before_action :require_signed_in!

  def show
    @thread = MessageThread.find(params[:id])
    if current_user.id == @thread.user_one_id || current_user.id == @thread.user_two_id
      @threads = current_user.threads

      @messages = @thread.messages.order('created_at DESC')
      @other_user = @thread.other_user(current_user)
      render :show
    end
  end

  def index
    @user = User.find(params[:user_id])
    @threads = @user.threads

    if request.xhr?
      render json: @threads
    else
      render :index
    end
  end

end
