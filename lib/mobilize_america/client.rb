require 'faraday'
require 'json'
require 'mobilize_america/client/events'

module MobilizeAmerica
  class Client
    attr_reader :connection

    API_DOMAIN = 'events.mobilizeamerica.io'.freeze
    API_BASE_PATH = '/api/v1'.freeze

    def initialize
      @connection = Faraday.new(url: "https://#{API_DOMAIN}")
    end

    def get(path:, params: {})
      request(method: :get, path: path, params: params)
    end

    include MobilizeAmerica::Client::Events

    private

    def request(method:, path:, params: {}, body: {})
      response = connection.send(method) do |req|
        req.path = "#{API_BASE_PATH}#{path}"
        req.params = params
        req.headers['Content-Type'] = 'application/json'
        req.body = ::JSON.generate(body) unless body.empty?
      end

      JSON.parse(response.body)
    end
  end
end
