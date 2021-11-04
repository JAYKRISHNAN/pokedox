# frozen_string_literal: true

require 'net/http'
require 'json'

# simple util class to get data as JSON from an API
class GetJsonApiData
  def self.json_api_response(url)
    uri_object = URI(url)
    response = Net::HTTP.get(uri_object)
    JSON.parse(response)
  end
end
