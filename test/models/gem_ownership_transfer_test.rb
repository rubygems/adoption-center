require 'test_helper'

class GemOwnershipTransferTest < ActiveSupport::TestCase
  test "should not save gem ownership transfer without ruby_gem, new_user or old_user" do
    gem_ownership_transfer = GemOwnershipTransfer.new
    gem_ownership_transfer.save
    assert_includes gem_ownership_transfer.errors, :ruby_gem
    assert_includes gem_ownership_transfer.errors, :new_user
    assert_includes gem_ownership_transfer.errors, :old_user
  end
end
