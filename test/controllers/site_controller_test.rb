require 'test_helper'

class SiteControllerTest < ActionController::TestCase

  test "should show count" do
    get :index
    assert_template :index
    assert_select '.gem__adoption__count', '1'
    assert_response :success
  end

  test "should get search" do
    get :search_gems, search: 'pg'

    assert_template :search_gems
    assert_select 'title', 'Search | RubyGems Adoption Center'
    assert_select '.gems__gem__info:first-child .gems__gem__name', 'pg'
    assert_response :success
  end
end
