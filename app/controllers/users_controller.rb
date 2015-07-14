# User Controller
class UsersController < ApplicationController
  def index
    @api_key_user = current_user.api_key
    @gems = Client.gems(@api_key_user)
  end
end
