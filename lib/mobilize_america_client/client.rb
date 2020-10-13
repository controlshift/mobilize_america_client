require 'faraday'
require 'mobilize_america_client/client/events'
require 'mobilize_america_client/client/organizations'
require 'mobilize_america_client/request'

module MobilizeAmericaClient
  class Client
    attr_reader :connection
    attr_accessor :api_key

    def initialize(options = {})
      self.api_key = options[:api_key]

      api_domain = options[:api_domain] || API_DOMAIN

      @connection = Faraday.new(url: "https://#{api_domain}")
    end

    include MobilizeAmericaClient::Request
    include MobilizeAmericaClient::Client::Events
    include MobilizeAmericaClient::Client::Organizations
  end
end
