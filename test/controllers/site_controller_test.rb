require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  
   
  test "should get index" do
    get :index

    assert_template :index
    assert_select "title", "Home | RubyGems AdoptionCenter"
    assert_response :success
  end

  test "should get search" do
    get :search_gems, search: 'rails'

    assert_template :search_gems
    assert_select "title", "| RubyGems AdoptionCenter"
    assert_response :success
  end

end
