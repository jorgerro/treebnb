
class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:secret]
    )

    if @user
      sign_in(@user)
      redirect_to root_url
    else
      flash.now[:errors] = "Invalid email/password combonation"
      render :new
    end
  end

  def new
    render :new
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private

  def session_params
    params.require(:user).permit(:email, :secret)
  end

end
