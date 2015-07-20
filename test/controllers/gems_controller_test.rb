require 'test_helper'

class GemsControllerTest < ActionController::TestCase
  def setup
    login_user(users(:angela))
  end

  test "should get index" do
    get :index

    assert_response :success
    assert_template :index
    assert_select "title", "My Gems | RubyGems AdoptionCenter"
  end
end
