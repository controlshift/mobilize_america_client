module MobilizeAmericaClient
  class Client
    module Events
      def organization_events(organization_id:, updated_since: nil, max_distance_miles: nil, page: nil, per_page: nil,
                              zipcode: nil)
        params = {}

        unless page.nil?
          params[:page] = page
        end

        unless per_page.nil?
          params[:per_page] = per_page
        end

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

    def organization_event(organization_id:, event_id:)
      get(path: "/organizations/#{esc(organization_id)}/events/#{esc(event_id)}")
    end
  end
end
