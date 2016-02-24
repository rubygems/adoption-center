require 'test_helper'

class GemsAdoptionTest < ActiveSupport::TestCase
  should validate_presence_of :ruby_gem
  should validate_presence_of :user
end
