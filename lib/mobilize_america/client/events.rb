module MobilizeAmerica
  class Client
    module Events
      def organization_events(organization_id:, updated_since: nil, zipcode: nil, max_distance_miles: nil)
        params = {}

        unless updated_since.nil?
          params[:updated_since] = updated_since.to_i
        end

        unless zipcode.nil?
          params[:zipcode] = zipcode

          unless max_distance_miles.nil?
            params[:max_dist] = max_distance_miles
          end
        end

        get(path: "/organizations/#{esc(organization_id)}/events", params: params)
      end
    end
  end
end
