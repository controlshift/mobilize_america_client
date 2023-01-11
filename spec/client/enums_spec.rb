require 'spec_helper'

RSpec.describe MobilizeAmericaClient::Client::Enums do
  let(:standard_headers) { {'Content-Type' => 'application/json'} }

  subject { MobilizeAmericaClient::Client.new }

  let(:base_url) { "https://#{MobilizeAmericaClient::Client::API_DOMAIN}#{MobilizeAmericaClient::Client::API_BASE_PATH}" }

  describe '#enums' do
    let(:enums_url) { "#{base_url}/enums" }
    let(:response) { {'hello' => 'world'} }

    it 'should call the endpoint and return JSON' do
      stub_request(:get, enums_url).with(headers: standard_headers).to_return(body: response.to_json)
      expect(subject.enums).to eq response
    end
  end
end
