# Session Controller
class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    username = auth["info"]["nickname"]
    token = auth["credentials"]["token"]
    email = auth["info"]["email"]
    user = User.find_or_initialize_by(username:username, token: token, email: email)
    if user.new_record? && !user.save
      flash[:danger] = 'Oops, something went wrong. Try again.'
      redirect_to :root
    else
      gems = Gems.gems(user.username)
      user.sync_gems(gems)
      session[:user_id] = user.id
      flash[:success] = 'Signed in!'
      redirect_to :gems
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logged out!'
    redirect_to :root
  end
end
