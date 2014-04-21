
class SessionsController < ApplicationController

  def create # sign in a user
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      sign_in(@user)
      flash[:notice] = ["Welcome back, #{ @user.fname }!"]
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid email/password combonation"]
      render :new
    end
  end

  def new
    render :new
  end

  def destroy # sign out a user
    sign_out
    redirect_to root_url
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
