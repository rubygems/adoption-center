require 'test_helper'

class GemsAdoptionTest < ActiveSupport::TestCase
  test "should not save gem without ruby_gem or user" do
    gems_adoption = GemsAdoption.new
    gems_adoption.save
    assert_includes gems_adoption.errors, :ruby_gem
    assert_includes gems_adoption.errors, :user
  end
end
