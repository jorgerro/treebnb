
class RoomsController < ApplicationController

  before_action :require_signed_in!, only: [:new, :create]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @listings = @user.listings
      render :user_index
    else
      if current_user
        @listings = Room.where("owner_id != ?", current_user.id)
      else
        @listings = Room.all
      end
      render :index
    end
  end

  def new
    render :new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to edit_room_url(@room)
    else
      flash.now[:errors] = @room.errors.full_messages
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @reviews = @room.reviews
    @owner = User.find(@room.owner_id)
    @requests = @room.room_requests
    render :show
  end

  def edit
    @room = Room.find(params[:id])
    render :edit
  end

  def update

    @room = Room.find(params[:id])
    if @room.update(room_params)
      picture_params["images"].each do |picture|
        Picture.create!({ "image" => picture, "room_id" => params[:id] })
      end
      redirect_to @room
    else
      flash.now[:errors] = @room.errors.full_messages
      render :edit
    end
  end


  private
    def room_params
      params.require(:room).permit(:owner_id, :home_type, :room_type,
      :num_possible_guests, :address_city, :address_neighborhood,
      :street_address, :address_zip_code, :title, :description,
      :num_bedrooms, :num_bathrooms, :price_per_night )
    end

    def picture_params
      params.require(:pictures).permit(images: [])
    end

end