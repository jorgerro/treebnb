
class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)

    if @message.save
      flash[:notice] = ["Your message to #{ @message.recipient.fname } has been sent."]
      redirect_to :back
    else
      flash[:errors] = @message.errors.full_messages
      redirect_to :back
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :sender_id, :recipient_id)
  end

end
