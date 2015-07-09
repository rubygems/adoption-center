include Client

class SessionsController < ApplicationController
	def new
	end

	def create
    user = Client.authenticate(params[:session][:username], params[:session][:password])
    if user
			username_exist = User.find_by_username(params[:session][:username])
			if username_exist
				session[:user_id] = username_exist.id
			else
				user_new = User.new(user_params)
				user_new.api_key = user
				user_new.save
				session[:user_id] = user_new.id
			end
      redirect_to users_path
    else
      flash.now[:danger] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
		flash[:success] = "Logged out!"
    redirect_to root_path
  end

	private
    def user_params
      params.require(:session).permit(:username)
    end
end
