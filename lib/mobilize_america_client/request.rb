require 'json'

module MobilizeAmericaClient
  module Request
    API_DOMAIN = 'events.mobilizeamerica.io'.freeze
    API_BASE_PATH = '/api/v1'.freeze

    def get(path:, params: {})
      request(method: :get, path: path, params: params)
    end

    private

    def esc(untrusted)
      CGI.escape(untrusted.to_s)
    end

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
