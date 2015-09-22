require 'test_helper'

class GemOwnershipTransfersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index

    assert_template :index
    assert_select "title", "Recent activity | RubyGems AdoptionCenter"
    assert_response :success
  end

end
