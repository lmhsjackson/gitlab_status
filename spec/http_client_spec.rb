# frozen_string_literal: true

require 'http_client/http_client'

RSpec.describe HttpClient do
  describe '#get' do
    it 'calls get with expected params' do
      allow(RestClient).to receive(:get)
      fake_url = 'www.testing123.com'
      fake_options = {}
      subject.get(fake_url, fake_options)
      expect(RestClient).to have_received(:get).with(fake_url, fake_options)
    end
  end
end
