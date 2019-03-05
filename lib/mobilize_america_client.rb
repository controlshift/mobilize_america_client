require 'mobilize_america_client/client'

module MobilizeAmerica
  class << self
    def new
      MobilizeAmericaClient::Client.new
    end
  end
end
