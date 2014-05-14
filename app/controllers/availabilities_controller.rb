
class AvailabilitiesController < ApplicationController

  before_action :require_signed_in!

  def new
    @availability = Availability.new
    @room = Room.find(params[:room_id])
    unless current_user.id == @room.owner_id
      redirect_to :back
      return
    end
    render :new
  end

  def create
    @availability = Availability.new(availability_params)

    if @availability.save
      redirect_to manage_room_url(@availability.room)
    else
      flash.now[:errors] = @availability.errors.full_messages
      render :new
    end
  end


  private
  def availability_params
    params.require(:availability).permit(:room_id, :start_date, :end_date)
  end


end
