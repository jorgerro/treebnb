
class DashboardController < ApplicationController

  before_action :require_signed_in!

  def root
    @user = User.find(params[:user_id])
    @trips = @user.requests_to_stay.where("status != 'CANCELLED'")


  end


end
