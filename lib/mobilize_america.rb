require 'mobilize_america/client'

module MobilizeAmerica
  class << self
    def new
      MobilizeAmerica::Client.new
    end
  end
end
