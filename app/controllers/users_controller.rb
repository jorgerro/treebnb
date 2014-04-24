
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
    @reviews = @user.reviews
    render :show
  end

  def edit
    # form should include additional fields that were
    # not included at signup as well as the original ones
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = ["Your profile has been updated"]
      redirect_to @user
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
