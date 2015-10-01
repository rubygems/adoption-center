require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should login with an existing user" do
    VCR.use_cassette("gems_existing_user") do
      response = Net::HTTP.get_response(URI('https://rubygems.org/api/v1/owners/angela4713/gems.json'))

      existing_user = users(:angela)
      #request.env["omniauth.auth"] = authenticate_with_github(existing_user)
      assert_no_difference 'User.count' do
        get :create
      end
      assert_redirected_to gems_path
      assert_equal 'Signed in!', flash[:success]
    end
  end

  test "should login with a new user" do
    VCR.use_cassette("gems_new_user") do
      response = Net::HTTP.get_response(URI('https://rubygems.org/api/v1/owners/linatodi/gems.json'))

      new_user = User.new(username: 'linatodi', token: SecureRandom.hex(8), email: 'torresdiazlina@gmail.com')
      #request.env["omniauth.auth"] = authenticate_with_github(new_user)
      assert_difference('User.count', 1) do
        get :create
      end
      assert_redirected_to gems_path
      assert_equal 'Signed in!', flash[:success]
    end
  end

  test "should logout" do
    get :destroy

    assert_redirected_to :root
    assert_equal 'Logged out!', flash[:success]
  end

end
