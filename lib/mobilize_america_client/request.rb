module MobilizeAmericaClient
  module Request
    API_DOMAIN = 'api.mobilize.us'.freeze
    API_BASE_PATH = '/v1'.freeze

    def get(path:, params: {})
      request(method: :get, path:, params:)
    end

    def post(path:, body:)
      request(method: :post, path:, body:)
    end

    private

    def esc(untrusted)
      CGI.escape(untrusted.to_s)
    end

    def request(method:, path:, params: {}, body: {})
      response = connection.send(method) do |req|
        req.path = "#{API_BASE_PATH}#{path}"
        req.params = params
        req.body = body

        unless api_key.nil?
          req.headers['Authorization'] = "Bearer #{api_key}"
        end
      end

      case response.status
      when 401
        raise MobilizeAmericaClient::UnauthorizedError, "Unauthorized: #{response.body}"
      when 404
        raise MobilizeAmericaClient::NotFoundError, "Not Found: #{response.body}"
      when 429
        retry_after_header = response.headers['Retry-After']
        message = "Rate Limited (Retry-After #{retry_after_header}): #{response.body}"
        raise MobilizeAmericaClient::RateLimitedError.new(message, retry_after: retry_after_header)
      when 400..499
        raise MobilizeAmericaClient::ClientError, "Client Error (#{response.status}): #{response.body}"
      when 500..599
        raise MobilizeAmericaClient::ServerError, "Server Error (#{response.status}): #{response.body}"
      end

      response.body
    end
  end
end
