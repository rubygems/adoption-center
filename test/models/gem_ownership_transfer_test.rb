require 'test_helper'

class GemOwnershipTransferTest < ActiveSupport::TestCase
  should validate_presence_of :ruby_gem
  should validate_presence_of :new_user
  should validate_presence_of :old_user
end
