require 'test_helper'

class RubyGemTest < ActiveSupport::TestCase
  test "should not save gem without name" do
    ruby_gem = RubyGem.new
    ruby_gem.save
    assert_includes ruby_gem.errors, :name
  end
end
