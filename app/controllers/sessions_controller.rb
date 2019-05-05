class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: session_params[:name])
    user = user.try(:authenticate, session_params[:password])
    redirect_to(login_path) && return unless user
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  def session_params
    params.require(:user).permit(:name, :password)
  end
end
