class WelcomeController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    redirect_to(login_path) && return if @user.nil?
  end
end
