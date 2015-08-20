require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without token or username" do
    user = User.new
    user.save
    assert_includes user.errors, :username
    assert_includes user.errors, :token
  end

  test "should store user ruby gems" do
    VCR.use_cassette("user gems") do
      response = Net::HTTP.get_response(URI('https://rubygems.org/api/v1/owners/ammancilla/gems.json'))

      user = users(:alfonso)
      assert_difference('user.ruby_gems.count', 3) do
        user.sync_gems(JSON.parse(response.body))
      end
    end
  end

  test "should remove gems that do not belongs to the user anymore" do
    response = [{"name"=>"play_hangman", "info"=>"Play Hangman on your console! Install, run the command 'play_hangman' and enjoy.\nThis game was built using the 'hangman_engine' gem. Check it out to build your own Hangman game.", "project_uri"=>"https://rubygems.org/gems/play_hangman"}]
    user = users(:angela)
    assert_difference('user.ruby_gems.count', -2) do
      user.sync_gems(response)
    end
  end

  test "should store user new gems" do
    response = [{"name"=>"rails", "info"=>"Full-stack web framework optimized for programmer happiness", "project_uri"=>"https://rubygems.org/gems/rails"}, {"name"=>"faraday", "info"=>"HTTP/REST API client library.", "project_uri"=>"https://rubygems.org/gems/faraday"}, {"name"=>"pg", "info"=>"Pg is the Ruby interface to the PostgreSQL", "project_uri"=>"https://rubygems.org/gems/pg"},
      {"name"=>"play_hangman", "info"=>"Play Hangman on your console! Install, run the command 'play_hangman' and enjoy.\nThis game was built using the 'hangman_engine' gem. Check it out to build your own Hangman game.", "project_uri"=>"https://rubygems.org/gems/play_hangman"}]
    user = users(:angela)
    assert_difference('user.ruby_gems.count', 1) do
      user.sync_gems(response)
    end
  end

  test "#owns_gem? should return true if the user owns the given gem, false if not" do
    user = users(:angela)
    assert user.owns_gem?(ruby_gems(:faraday))
    assert_not user.owns_gem?(ruby_gems(:kaminari))
  end
end
