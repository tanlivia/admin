class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      I18n.locale = user.locale || I18n.default_locale
      redirect_to '/source'
    else
      flash.now.alert = "Invalid username or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    I18n.locale = I18n.default_locale
    redirect_to root_url
  end
end
