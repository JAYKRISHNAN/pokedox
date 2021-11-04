# frozen_string_literal: true

require 'net/http'
require 'json'
require_relative '../exceptions/network_error'

# simple util class to get data as JSON from an API
class GetJsonApiData
  NETWORK_REQUEST_ERRORS = [Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, Net::HTTPBadResponse].freeze

  def self.json_api_response(url)
    uri_object = URI(url)
    response = Net::HTTP.get(uri_object)
    JSON.parse(response)
  rescue *NETWORK_REQUEST_ERRORS
    raise NetworkError
  end
end
