require 'faraday'
require 'mobilize_america/client/events'
require 'mobilize_america/request'

module MobilizeAmerica
  class Client
    attr_reader :connection

    def initialize
      @connection = Faraday.new(url: "https://#{API_DOMAIN}")
    end

    include MobilizeAmerica::Request
    include MobilizeAmerica::Client::Events
  end
end
