require 'test_helper'

class AdoptionRequestTest < ActiveSupport::TestCase
  test "should not save gem without gems_adoption_id or user_id" do
    adoption_request = AdoptionRequest.new
    adoption_request.save
    refute adoption_request.save
    assert_includes adoption_request.errors, :gems_adoption
    assert_includes adoption_request.errors, :user
  end
end
