module MobilizeAmericaClient
  class ClientError < StandardError
  end

  class UnauthorizedError < ClientError
  end

  class NotFoundError < ClientError
  end

  class RateLimitedError < ClientError
    attr_reader :retry_after

    def initialize(message, retry_after: nil)
      @retry_after = Integer(retry_after, exception: false)

      super(message)
    end
  end

  class ServerError < StandardError
  end
end
