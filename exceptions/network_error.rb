# frozen_string_literal: true

# custom error class for network errors
class NetworkError < StandardError
  def message
    'Network request failed!'
  end
end
