
class AvailabilitiesController < ApplicationController

  def new
    @availability = Availability.new
    @room = Room.find(params[:room_id])
    render :new
  end

  def create
    @availability = Availability.new(availability_params)

    if @availability.save
      redirect_to @availability.room
    else
      flash.now[:errors] = @availability.errors.full_messsages
      render :new
    end
  end


  private
  def availability_params
    params.require(:availability).permit(:room_id, :start_date, :end_date)
  end


end
