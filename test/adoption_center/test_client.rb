require 'minitest/autorun'
require '../lib/client'
include Client

# Test for the module Client
class ClientTest < Minitest::Test
  def test_authenticate
    response = Client.authenticate('teambinaryrg@gmail.com', 'testapiclient')
    assert_equal 32, response.length
    assert response.match(/^[0-9a-z]+$/), msg = 'No match'
  end

  def test_gems
    response = Client.authenticate('teambinaryrg@gmail.com', 'testapiclient')
    gems_owner = Client.gems(response)
    assert_equal Array, gems_owner.class
  end
end
