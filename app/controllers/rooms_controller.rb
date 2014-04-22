
class RoomsController < ApplicationController

  before_action :require_signed_in!, only: [:new, :create]

  def new
    render :new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room #later redirect to edit to fill out more fields
    else
      flash.now[:errors] = @room.errors.full_messages
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    render :show
  end

  def edit
    @room = Room.find(params[:id])

  end


  private
    def room_params
      params.require(:room).permit(:home_type, :room_type,
      :num_possible_guests, :address_city, :address_neighborhood,
      :street_address, :address_zip_code, :owner_id)
    end

end