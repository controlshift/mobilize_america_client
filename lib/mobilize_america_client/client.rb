require 'faraday'
require 'mobilize_america_client/client/attendances'
require 'mobilize_america_client/client/enums'
require 'mobilize_america_client/client/events'
require 'mobilize_america_client/client/organizations'
require 'mobilize_america_client/request'
require 'mobilize_america_client/errors'

module MobilizeAmericaClient
  class Client
    attr_reader :connection
    attr_accessor :api_key

    def initialize(options = {})
      self.api_key = options[:api_key]

      api_domain = options[:api_domain] || API_DOMAIN

      @connection = Faraday.new(url: "https://#{api_domain}", request: { params_encoder: Faraday::FlatParamsEncoder })
    end

    include MobilizeAmericaClient::Request
    include MobilizeAmericaClient::Client::Attendances
    include MobilizeAmericaClient::Client::Enums
    include MobilizeAmericaClient::Client::Events
    include MobilizeAmericaClient::Client::Organizations
  end
end
