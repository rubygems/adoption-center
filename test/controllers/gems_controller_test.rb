require 'test_helper'

class GemsControllerTest < ActionController::TestCase
  def setup
    login_user(users(:angela))
  end

  test "should retrieve user gems and get index" do
    VCR.use_cassette("response_gems") do
      response = Net::HTTP.get_response(URI('https://rubygems.org/api/v1/owners/teambinary/gems.json'))

      get :index

      assert_equal Array, JSON.parse(response.body).class
      assert_template :index
      assert_select "title", "My Gems | RubyGems AdoptionCenter"
      assert_response :success
    end
  end

  test "should get show" do
    VCR.use_cassette("response_info_gem") do
      response = Net::HTTP.get_response(URI('https://rubygems.org/api/v1/gems/rails.json'))

      get :show, id: 'rails'

      assert_equal Hash, JSON.parse(response.body).class
      assert_template :show
      assert_select "title", "Information Gem | RubyGems AdoptionCenter"
      assert_select "#gem_name", "Gem:
  rails"
      assert_select "#gem_description", "Description:
  Ruby on Rails is a full-stack web framework optimized for programmer happiness and sustainable productivity. It encourages beautiful code by favoring convention over configuration."
      assert_response :success
    end
  end
end
