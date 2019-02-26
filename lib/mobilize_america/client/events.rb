module MobilizeAmerica
  class Client
    module Events
      def organization_events(organization_id:)
        get(path: "/organizations/#{esc(organization_id)}/events")
      end
    end
  end
end
