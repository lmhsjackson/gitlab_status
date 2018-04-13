# frozen_string_literal: true

RSpec.describe GitlabStatus do
  TEST_WEB = 'www.some.com'
  before do
    allow(subject).to receive(:sleep)
    allow(HttpClient).to receive(:get)
  end

  it 'has a version number' do
    expect(GitlabStatus::VERSION).not_to be nil
  end

  describe '#average_response' do
    it 'gets the web 6 times' do
      subject.average_response(TEST_WEB)
      expect(HttpClient).to have_received(:get).with(TEST_WEB)
                                               .exactly(6).times
    end

    it 'sleeps 10 seconds 5 times' do
      subject.average_response(TEST_WEB)
      expect(subject).to have_received(:sleep).with(10)
                                              .exactly(5).times
    end
  end

  describe '#response_time' do
    it 'returns a number of seconds' do
      time = subject.response_time(TEST_WEB)
      expect(time).to be_kind_of(Float)
    end
  end
end
