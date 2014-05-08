
class MessageThreadsController < ApplicationController

  before_action :require_signed_in!

  def show
    @thread = MessageThread.find(params[:id])
    if current_user.id == @thread.user_one_id || current_user.id == @thread.user_two_id
      @threads = current_user.threads



          if @thread.has_unread_messages?
            @thread.messages.where(is_read: false).each do |message|
              message.update(is_read: true)
            end
          end


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
