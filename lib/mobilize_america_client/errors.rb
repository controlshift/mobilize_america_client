module MobilizeAmericaClient
  class NotFoundError < StandardError
  end

  class UnauthorizedError < StandardError
  end

  class ServerError < StandardError
  end

  class ClientError < StandardError
  end
end
