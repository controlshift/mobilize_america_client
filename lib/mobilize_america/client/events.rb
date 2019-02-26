module MobilizeAmerica
  class Client
    module Events
      def organization_events(organization_id:, updated_since: nil)
        params = {}

        unless updated_since.nil?
          params[:updated_since] = updated_since.to_i
        end

        get(path: "/organizations/#{esc(organization_id)}/events", params: params)
      end
    end
  end
end
