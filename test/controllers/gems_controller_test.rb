require 'test_helper'

class GemsControllerTest < ActionController::TestCase
  def setup
    login_user(users(:angela))
  end

  test "should retrieve user gems and get index" do
    VCR.use_cassette("response_gems") do
      response = Net::HTTP.get_response(URI('https://rubygems.org/api/v1/owners/teambinary/gems.json'))
      assert_equal Array, JSON.parse(response.body).class
      get :index
      assert_template :index
      assert_select "title", "My Gems | RubyGems AdoptionCenter"
      assert_response :success
    end
  end
end
