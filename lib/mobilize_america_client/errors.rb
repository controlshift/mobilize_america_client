module MobilizeAmericaClient
  class ClientError < StandardError
  end

  class UnauthorizedError < ClientError
  end

  class NotFoundError < ClientError
  end

  class RateLimitedError < ClientError
  end

  class ServerError < StandardError
  end
end
