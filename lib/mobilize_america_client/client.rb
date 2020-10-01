require 'faraday'
require 'mobilize_america_client/client/events'
require 'mobilize_america_client/client/organizations'
require 'mobilize_america_client/request'

module MobilizeAmericaClient
  class Client
    attr_reader :connection

    def initialize
      @connection = Faraday.new(url: "https://#{API_DOMAIN}")
    end

    include MobilizeAmericaClient::Request
    include MobilizeAmericaClient::Client::Events
    include MobilizeAmericaClient::Client::Organizations
  end
end
