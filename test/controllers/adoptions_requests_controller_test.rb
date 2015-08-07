require 'test_helper'

class AdoptionsRequestsControllerTest < ActionController::TestCase
  def setup
    login_user(users(:angela))
  end

  test "should get new" do
    get :new, id: '1'

    assert_template :new
    assert_select "title", "Aditional Information for Adoption Request | RubyGems AdoptionCenter"
    assert_response :success
  end

  test "should create an adoption request" do
    assert_difference('AdoptionsRequest.count', 1) do
      post :create, adoptions_request: { gems_adoption_id: 1, description: 'Gem for adoption'}
    end
    assert_equal 'Adoption request sent', flash[:success]
    assert_redirected_to gem_path(id: 'pg')
  end

  test "should not create an adoption request" do
    assert_no_difference 'AdoptionsRequest.count' do
      post :create, adoptions_request: { gems_adoption_id: '', description: 'Gem for adoption'}
    end
    assert_template "new"
  end
end
