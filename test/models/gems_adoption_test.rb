require 'test_helper'

class GemsAdoptionTest < ActiveSupport::TestCase
  test "should not save gem without gem or user_id" do
    gems_adoption = GemsAdoption.new
    gems_adoption.save
    assert_includes gems_adoption.errors, :gem
    assert_includes gems_adoption.errors, :user_id
  end
end
