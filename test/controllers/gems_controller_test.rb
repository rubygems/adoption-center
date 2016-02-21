require 'test_helper'

class GemsControllerTest < ActionController::TestCase
  def setup
    login_user(users(:angela))
  end

  test "should retrieve user gems and get index" do
    get :index

    assert_template :index
    assert_select "title", "My Gems | RubyGems Adoption Center"
    assert_response :success
  end

  test "should get show" do
    ruby_gem = ruby_gems(:pg)

    get :show, id: ruby_gem.id

    assert_template :show
    assert_select "title", "Gem #{ruby_gem.name} | RubyGems Adoption Center"
    assert_select "h1.t-display.page__heading a", ruby_gem.name
    assert_select "#markup span", "#{ruby_gem.info}"
    assert_response :success
  end
end
