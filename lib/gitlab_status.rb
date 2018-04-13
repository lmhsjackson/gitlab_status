# frozen_string_literal: true

require 'gitlab_status/version'
require 'http_client/http_client'
require 'benchmark'

# Here the doc goes
module GitlabStatus
  def self.average_response(gitlab_page)
    response_times = []
    6.times do |n|
      response_times << response_time(gitlab_page)
      sleep 10 unless n == 5
    end
    response_times.inject { |sum, el| sum + el }.to_f / 6
  end

  def self.response_time(gitlab_page)
    Benchmark.realtime do
      HttpClient.get(gitlab_page)
    end
  end
end
