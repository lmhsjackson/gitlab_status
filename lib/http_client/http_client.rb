# frozen_string_literal: true

require 'rest-client'

# Wrapper for httparty
module HttpClient
  def self.get(url, options = {})
    RestClient.get(url, options)
  end
end
