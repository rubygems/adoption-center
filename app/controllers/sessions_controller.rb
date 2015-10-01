# Session Controller
class SessionsController < ApplicationController
  def create
    redirect_to client.auth_code.authorize_url(redirect_uri: redirect_uri)
    access_token = client.auth_code.get_token(params[:code], redirect_uri: redirect_uri)
    username = 'prueba_username'
    token = access_token.token
    email = 'prueba_email'
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

  private

  def client
    OAuth2::Client.new(ENV["CONSUMER_KEY"], ENV["CONSUMER_SECRET"], site: "http://rubygems.dev")
  end

  def redirect_uri
    uri = URI.parse(request.url)
    uri.path = '/callback'
    uri.query = nil
    uri.to_s
  end
end
