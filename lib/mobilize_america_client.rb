require 'mobilize_america_client/client'

module MobilizeAmerica
  class << self
    def new(options = {})
      MobilizeAmericaClient::Client.new(options)
    end
  end
end
