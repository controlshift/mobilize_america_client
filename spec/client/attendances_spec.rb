require 'spec_helper'

RSpec.describe MobilizeAmericaClient::Client::Attendances do
  let(:api_key) { 'abcde-123456' }
  let(:request_headers) { { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{api_key}"} }
  let(:response_headers) {{ 'Content-Type' => 'application/json' }}
  let(:base_url) { "https://#{MobilizeAmericaClient::Client::API_DOMAIN}#{MobilizeAmericaClient::Client::API_BASE_PATH}" }

  subject { MobilizeAmericaClient::Client.new(api_key: api_key) }

  describe '#organization_attendances' do
    let(:org_id) { 123 }
    let(:attendances_url) { "#{base_url}/organizations/#{org_id}/attendances" }
    let(:response) { {'data' => [{'id' => 1, 'event' => {'id' => 1111}}, {'id' => 2, 'event' => {'id' => 2222}}]} }

    context 'unauthenticated request' do
      let(:api_key) { nil }

      it 'should raise if response status is 401' do
        stub_request(:get, attendances_url).with(headers: {'Content-Type' => 'application/json'}).to_return(status: 401, body: {error: 'unauthorized'}.to_json)

        expect { subject.organization_attendances(organization_id: org_id) }.to raise_error MobilizeAmericaClient::UnauthorizedError
      end
    end

    it 'should raise if response status is 404' do
      stub_request(:get, attendances_url).with(headers: request_headers).to_return(status: 404, body: { error: 'not found'}.to_json)

      expect { subject.organization_attendances(organization_id: org_id) }.to raise_error MobilizeAmericaClient::NotFoundError
    end

    it 'should call the endpoint and return JSON' do
      stub_request(:get, attendances_url).with(headers: request_headers).to_return(body: response.to_json, headers: response_headers)
      expect(subject.organization_attendances(organization_id: org_id)).to eq(response)
    end

    it 'should escape the organization ID' do
      expected_url = "#{base_url}/organizations/foo%2Fbar/attendances"
      stub_request(:get, expected_url).with(headers: request_headers).to_return(body: response.to_json, headers: response_headers)
      expect(subject.organization_attendances(organization_id: 'foo/bar')).to eq(response)
    end

    it 'should support an updated_since parameter' do
      updated_since = Time.new
      stub_request(:get, attendances_url)
        .with(headers: request_headers, query: { updated_since: updated_since.to_i})
        .to_return(body: response.to_json, headers: response_headers)
      expect(subject.organization_attendances(organization_id: org_id, updated_since: updated_since)).to eq(response)
    end

    it 'should support pagination parameters' do
      stub_request(:get, attendances_url)
        .with(headers: request_headers, query: { page: 2, per_page: 100})
        .to_return(body: response.to_json, headers: response_headers)
      expect(subject.organization_attendances(organization_id: org_id, page: 2, per_page: 100)).to eq(response)
    end
  end
end
