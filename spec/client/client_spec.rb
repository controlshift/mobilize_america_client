require 'spec_helper'

RSpec.describe MobilizeAmericaClient::Client do
  subject { MobilizeAmericaClient::Client.new(api_key: 'abc123') }

  it 'should set the api_key' do
    expect(subject.api_key).to eq('abc123')
  end
end
