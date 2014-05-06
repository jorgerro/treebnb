
class DashboardController < ApplicationController

  before_action :require_signed_in!

  def root
    @user = User.find(params[:user_id])
    @threads = @user.threads
    render :root
  end

end
