require 'test_helper'

class GemsAdoptionsControllerTest < ActionController::TestCase
  def setup
    login_user(users(:angela))
  end

  test "should get index" do
    get :index

    assert_template :index
    assert_select "title", "Gems up for Adoption | RubyGems AdoptionCenter"
    assert_response :success
  end

  test "should get new" do
    get :new, id: 'rails'

    assert_template :new
    assert_select "title", "Aditional Information | RubyGems AdoptionCenter"
    assert_response :success
  end

  test "should create a gem for adoption" do
    assert_difference('GemsAdoption.count', 1) do
      post :create, gems_adoption: { gem: 'rails', description: 'Gem for adoption'}
    end
    assert_equal 'Gem up for adoption', flash[:success]
    assert_redirected_to gem_path(id: 'rails')
  end

  test "should not create a gem for adoption" do
    assert_no_difference 'GemsAdoption.count' do
      post :create, gems_adoption: { gem: '', description: 'I cant maintain this gem'}
    end
    assert_template "new"
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
