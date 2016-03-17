require 'test_helper'

class AdoptionRequestTest < ActiveSupport::TestCase
  should validate_presence_of :gems_adoption
  should validate_presence_of :user
end
