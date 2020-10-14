require 'spec_helper'

RSpec.describe MobilizeAmericaClient::Client::Events do
  let(:standard_headers) { {'Content-Type' => 'application/json'} }

  subject { MobilizeAmericaClient::Client.new }

  let(:base_url) { "https://#{MobilizeAmericaClient::Client::API_DOMAIN}#{MobilizeAmericaClient::Client::API_BASE_PATH}" }

  describe '#organization_events' do
    let(:org_id) { 123 }
    let(:events_url) { "#{base_url}/organizations/#{org_id}/events" }
    let(:response) { {'data' => [{'id' => 1, 'description' => 'event 1'}, {'id' => 2, 'description' => 'event 2'}]} }

    it 'should call the endpoint and return JSON' do
      stub_request(:get, events_url).with(headers: standard_headers).to_return(body: response.to_json)
      expect(subject.organization_events(organization_id: org_id)).to eq(response)
    end

    it 'should escape the organization ID' do
      expected_url = "#{base_url}/organizations/foo%2Fbar/events"
      stub_request(:get, expected_url).with(headers: standard_headers).to_return(body: response.to_json)
      expect(subject.organization_events(organization_id: 'foo/bar')).to eq(response)
    end

    it 'should support an updated_since parameter' do
      updated_since = Time.new
      stub_request(:get, events_url)
        .with(headers: standard_headers, query: {updated_since: updated_since.to_i})
        .to_return(body: response.to_json)
      expect(subject.organization_events(organization_id: org_id, updated_since: updated_since)).to eq(response)
    end

    it 'should support a zipcode parameter' do
      zipcode = '23456'
      stub_request(:get, events_url)
        .with(headers: standard_headers, query: {zipcode: zipcode})
        .to_return(body: response.to_json)
      expect(subject.organization_events(organization_id: org_id, zipcode: zipcode)).to eq(response)
    end

    it 'should support a max_dist parameter to go with zipcode' do
      stub_request(:get, events_url)
        .with(headers: standard_headers, query: {zipcode: '23456', max_dist: 100})
        .to_return(body: response.to_json)
      expect(subject.organization_events(organization_id: org_id, zipcode: '23456', max_distance_miles: 100)).to eq(response)
    end

    it 'should support pagination parameters' do
      stub_request(:get, events_url)
        .with(headers: standard_headers, query: {page: 2, per_page: 100})
        .to_return(body: response.to_json)
      expect(subject.organization_events(organization_id: org_id, page: 2, per_page: 100)).to eq(response)
    end
  end

  describe '#organization_event' do
    let(:org_id) { 123 }
    let(:event_id) { 456 }
    let(:events_url) { "#{base_url}/organizations/#{org_id}/events/#{event_id}" }
    let(:response) { '{"hello": "world"}' }

    it 'should support pagination parameters' do
      stub_request(:get, events_url)
          .with(headers: standard_headers)
          .to_return(body: response.to_json)
      expect(subject.organization_event(organization_id: org_id, event_id: event_id)).to eq(response)
    end
  end
end
