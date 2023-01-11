module MobilizeAmericaClient
  class Client
    module Enums
      def enums
        get(path: '/enums')
      end
    end
  end
end
