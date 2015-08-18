require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  

  test "should get search" do
    get :search_gems, search: 'pg'

    assert_template :search_gems
    assert_select "title", "| RubyGems AdoptionCenter"
    assert_select "#gem_name", "pg"
    assert_response :success
  end

end
