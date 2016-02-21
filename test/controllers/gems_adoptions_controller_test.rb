require 'test_helper'

class GemsAdoptionsControllerTest < ActionController::TestCase
  def setup
    login_user(users(:angela))
  end

  test "should get index" do
    get :index

    assert_template :index
    assert_select "title", "Gems up for Adoption | RubyGems Adoption Center"
    assert_select ".gems__gem__info:first-child .gems__gem__name", "pg"
    assert_select ".gems__gem__info:first-child .gems__gem__desc", "Pg is the Ruby interface to the PostgreSQL"
    assert_response :success
  end

  test "should get new" do
    get :new, id: 1

    assert_template :new
    assert_select "title", "Adoption Form | RubyGems Adoption Center"
    assert_response :success
  end

  test "should create a gem for adoption" do
    assert_difference('GemsAdoption.count', 1) do
      post :create, gems_adoption: { ruby_gem_id: 1, description: 'Gem for adoption'}
    end
    assert_equal 'Gem up for adoption', flash[:success]
    assert_redirected_to gem_path(id: 1)
  end

  test "should close a gem up for adoption" do
    adoption_request = adoption_requests(:one)
    assert_difference('GemOwnershipTransfer.count') do
      put :update, id: adoption_request.id
    end
    assert_redirected_to gem_path(id: 3)
  end

  test "should destroy gem for adoption" do
    gems_adoptions = gems_adoptions(:pg)
    assert_difference('GemsAdoption.count', -1) do
      delete :destroy, id: gems_adoptions.id
    end
    assert_redirected_to gems_path
    assert_equal 'Gem removed from adoption', flash[:success]
  end
end
