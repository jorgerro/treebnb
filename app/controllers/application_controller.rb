class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :signed_in?, :current_user

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_session_token(session[:token])
  end


  def sign_in(user)
    user.reset_session_token!
    session[:token] = user.session_token
  end

  def sign_out
    current_user.reset_session_token!
    session[:token] = nil
  end

  def signed_in?
    !!@current_user
  end

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end


end
