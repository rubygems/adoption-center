require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without token or username" do
    user = User.new
    user.save
    assert_includes user.errors, :username
    assert_includes user.errors, :token
  end
end
