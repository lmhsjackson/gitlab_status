# frozen_string_literal: true

require 'rest-client'

# Wrapper for rest client
module HttpClient
  def self.get(url, options = {})
    RestClient.get(url, options)
  rescue RestClient::Exceptions::OpenTimeout => e
    puts "There was a timeout trying to reach #{url}"
    e.response
  rescue SocketError
    puts 'The network connection failed'
  end
end
