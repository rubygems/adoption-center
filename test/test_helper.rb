ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  OmniAuth.config.test_mode = true

  # Add more helper methods to be used by all tests here...
  def login_user(user)
    authenticate_with_github(user)
    session[:user_id] = user.id
  end

  def authenticate_with_github(user)
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
          :provider => 'github',
          :info => {
            :nickname => user.username,
            :email => user.email
          },
          :credentials => {
            :token => user.token
          }
        })
  end
end
