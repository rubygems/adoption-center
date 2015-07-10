# User Controller
class UsersController < ApplicationController
  def index
    @api_key_user = current_user.api_key
  end
end
