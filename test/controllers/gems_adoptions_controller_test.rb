require 'test_helper'

class GemsAdoptionsControllerTest < ActionController::TestCase
  def setup
    login_user(users(:angela))
  end

  test "should get index" do
    get :index

    assert_template :index
    assert_select "title", "Gems up for Adoption | RubyGems AdoptionCenter"
    assert_select "#gem_name", "pg"
    assert_select "#gem_info_adoption", "Gem looking for a new maintainer"
    assert_response :success
  end

  test "should get new" do
    get :new, id: 1

    assert_template :new
    assert_select "title", "Aditional Information | RubyGems AdoptionCenter"
    assert_response :success
  end

  test "should create a gem for adoption" do
    assert_difference('GemsAdoption.count', 1) do
      post :create, gems_adoption: { ruby_gem_id: 1, description: 'Gem for adoption'}
    end
    assert_equal 'Gem up for adoption', flash[:success]
    assert_redirected_to gem_path(id: 1)
  end

  test "should destroy gem for adoption" do
    g = gems_adoptions(:pg)
    assert_difference('GemsAdoption.count', -1) do
      delete :destroy, id: g.id
    end
    assert_redirected_to gems_path
    assert_equal 'Gem removed', flash[:success]
  end
end
