require 'test_helper'

class AdoptionRequestsControllerTest < ActionController::TestCase
  def setup
    login_user(users(:angela))
  end

  test "should get new" do
    get :new, id: 1

    assert_template :new
    assert_select "title", "Adoption Request Form | RubyGems AdoptionCenter"
    assert_response :success
  end

  test "should list adoptions requests" do
    get :index

    assert_template :index
    assert_select "title", "Adoptions Requests | RubyGems AdoptionCenter"
    assert_select ".gem-name", "pg"
    assert_response :success
  end

  test "should create an adoption request" do
    assert_difference('AdoptionRequest.count', 1) do
      post :create, adoption_request: { gems_adoption_id: 1, description: 'I want adopt this gem'}
    end
    assert_equal 'Adoption request sent', flash[:success]
    assert_redirected_to gem_path(id: 3)
  end
end
