require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should login with an existing user" do
    existing_user = users(:angela)
    request.env["omniauth.auth"] = authenticate_with_github(existing_user)
    assert_no_difference 'User.count' do
      get :create, provider: 'github'
    end
    assert_redirected_to gems_path
    assert_equal 'Signed in!', flash[:success]
  end

  test "should login with a new user" do
    new_user = User.new(username: 'linatodi', token: SecureRandom.hex(8), email: 'torresdiazlina@gmail.com')
    request.env["omniauth.auth"] = authenticate_with_github(new_user)
    assert_difference('User.count', 1) do
      get :create, provider: 'github'
    end
    assert_redirected_to gems_path
    assert_equal 'Signed in!', flash[:success]
  end

  test "should logout" do
    get :destroy

    assert_redirected_to :root
    assert_equal 'Logged out!', flash[:success]
  end

end
