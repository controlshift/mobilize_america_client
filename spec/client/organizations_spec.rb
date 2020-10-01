require 'spec_helper'

RSpec.describe MobilizeAmericaClient::Client::Organizations do
  let(:standard_headers) { {'Content-Type' => 'application/json'} }

  subject { MobilizeAmericaClient::Client.new }

  let(:base_url) { "https://#{MobilizeAmericaClient::Client::API_DOMAIN}#{MobilizeAmericaClient::Client::API_BASE_PATH}" }

  describe '#organizations' do
    let(:organizations_url) { "#{base_url}/organizations" }
    let(:response) { fixture('organizations.json').read }

    it 'should call the endpoint and return JSON' do
      stub_request(:get, organizations_url).with(headers: standard_headers).to_return(body: response.to_json)
      expect(subject.organizations).to eq response
    end
  end
end
