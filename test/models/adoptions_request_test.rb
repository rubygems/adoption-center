require 'test_helper'

class AdoptionsRequestTest < ActiveSupport::TestCase
  test "should not save gem without gems_adoption_id or user_id" do
    g = AdoptionsRequest.new
    g.save
    assert_includes g.errors, :gems_adoption_id
    assert_includes g.errors, :user_id
  end
end
