
class RoomRequestsController < ApplicationController

  before_action :require_signed_in!

  #should instead require that you are the specific user

  def new
    @room = Room.find(params[:room_id])
    render :new
  end

  def create
    @room = Room.find(params[:room_id])
    @request = RoomRequest.new(request_params)
    if @request.save
      @request.new_request_notification
      redirect_to user_room_requests_url(current_user)
    else
      flash.now[:errors] = @request.errors.full_messages
      render :new
    end
  end

  def index
    unless current_user.id == params[:user_id].to_i
      flash[:notice] = ["You can only see your own trips"]
      redirect_to root_url
      return
    end
    @user = User.find(params[:user_id])
    @requests = @user.requests_to_stay
    render :index
  end

  def approve
    @request = RoomRequest.find(params[:id])
    @request.approve!
    redirect_to @request.room
  end

  def deny
    @request = RoomRequest.find(params[:id])
    @request.deny!
    redirect_to @request.room
  end

  def cancel
    @request = RoomRequest.find(params[:id])
    @request.cancel!
    redirect_to user_room_requests_url(@request.guest)
  end

  private
  def request_params
    params.require(:request).permit(:start_date, :end_date, :status, :room_id,
    :guest_id, :num_guests)
  end

end