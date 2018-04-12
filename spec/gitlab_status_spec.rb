# frozen_string_literal: true

RSpec.describe GitlabStatus do
  it 'has a version number' do
    expect(GitlabStatus::VERSION).not_to be nil
  end
end
