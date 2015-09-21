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
    assert_select "title", "Gem Information | RubyGems AdoptionCenter"
    assert_select ".gem-name", "rails"
    assert_select ".gem-info", "Full-stack web framework optimized for programmer happiness"
    assert_response :success
  end
end
