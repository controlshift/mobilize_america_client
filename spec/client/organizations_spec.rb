require 'spec_helper'
require 'shared_examples/response_error_handling'

RSpec.describe MobilizeAmericaClient::Client::Organizations do
  let(:standard_headers) { {'Content-Type' => 'application/json'} }

  subject { MobilizeAmericaClient::Client.new }

  let(:base_url) { "https://#{MobilizeAmericaClient::Client::API_DOMAIN}#{MobilizeAmericaClient::Client::API_BASE_PATH}" }

  describe '#organizations' do
    let(:organizations_url) { "#{base_url}/organizations" }
    let(:response) { fixture('organizations.json').read }

    it_behaves_like 'response error handling' do
      let(:call_client_method) do
        -> { subject.organizations }
      end
      let(:set_up_stub_request) do
        -> do
          stub_request(:get, organizations_url).with(headers: standard_headers)
            .to_return(status: response_status, body: response_body, headers: response_headers)
        end
      end
    end

    it 'should call the endpoint and return JSON' do
      stub_request(:get, organizations_url).with(headers: standard_headers).to_return(body: response.to_json, headers: { 'Content-Type' => 'application/json' })
      expect(subject.organizations).to eq response
    end
  end
end
