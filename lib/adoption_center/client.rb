require 'faraday'
require 'json'

# Module Client for authenticate and return gems
module Client
  def authenticate(user, password)
    connection = Faraday.new 'https://rubygems.org/api/v1/api_key.json'
    connection.basic_auth(user, password)
    response = connection.get
    if response.body == "HTTP Basic: Access denied.\n"
      nil
    else
      JSON.parse(response.body)['rubygems_api_key']
    end
  end

  def gems(token)
    connection = Faraday.new
    response = connection.get do |req|
      req.url 'https://rubygems.org/api/v1/gems.json'
      req.headers = { 'Authorization' => token }
    end
    JSON.parse(response.body)
  end
end
