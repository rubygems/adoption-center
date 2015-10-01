ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_user(user)
    authenticate_with_rubygems(user)
    session[:user_id] = user.id
  end

  def authenticate_with_rubygems(user)

  end

  VCR.configure do |config|
    config.cassette_library_dir = "test/vcr_cassettes"
    config.hook_into :webmock
  end
end
