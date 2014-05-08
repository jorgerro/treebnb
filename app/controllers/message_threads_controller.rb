
class MessageThreadsController < ApplicationController

  before_action :require_signed_in!

  def show
    @thread = MessageThread.find(params[:id])
    if current_user.id == @thread.user_one_id || current_user.id == @thread.user_two_id
      @messages = @thread.messages.order('created_at DESC')
      @other_user = (@thread.user_one_id == current_user.id) ? @thread.user_two : @thread.user_one
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
