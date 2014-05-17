class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  helper_method :current_user

  def set_locale
    I18n.locale = current_user.locale if current_user and current_user.locale
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
