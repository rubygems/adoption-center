require 'test_helper'

class GemsControllerTest < ActionController::TestCase
  def setup
    login_user(users(:angela))
  end

  test "should retrieve user gems and get index" do
    get :index

    assert_template :index
    assert_select "title", "My Gems | RubyGems AdoptionCenter"
    assert_response :success
  end

  test "should get show" do
    get :show, id: 1

    assert_template :show
    assert_select "title", "Information Gem | RubyGems AdoptionCenter"
    assert_select "#gem_name", "Gem:
  rails"
    assert_select "#gem_description", "Description:
  Full-stack web framework optimized for programmer happiness"
    assert_response :success
  end
end
