
class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      flash[:notice] = ["Welcome, #{ @user.fname }!"]
      redirect_to edit_user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.order("created_at DESC")

    if request.xhr?
      render json: @user
    else
      render :show
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      if request.xhr?
        puts "**********************FUN****************************"
        render json: @user
      else
        flash[:notice] = ["Your profile has been updated"]
        redirect_to @user
      end
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:fname, :lname, :password, :email,
      :avatar, :birthdate, :description, :phone_number, :gender)
    end
end
