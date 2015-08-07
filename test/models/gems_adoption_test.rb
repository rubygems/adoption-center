require 'test_helper'

class GemsAdoptionTest < ActiveSupport::TestCase
  test "should not save gem without gem or user_id" do
    g = GemsAdoption.new
    g.save
    assert_includes g.errors, :gem
    assert_includes g.errors, :user_id
  end
end
