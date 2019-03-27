class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authorized

  def current_user
    user_id = session['user_id']
    @current_user ||= User.find_by(id: user_id)
    return @current_user
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

end
