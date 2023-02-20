module MobilizeAmericaClient
  class Client
    module Events
      def organization_events(organization_id:, timeslot_start: nil, timeslot_end: nil, updated_since: nil,
                              max_distance_miles: nil, page: nil, per_page: nil, zipcode: nil,  event_campaign_id: nil,
                              tag_ids: nil, event_types: nil, is_virtual: nil, exclude_full: nil)
        params = {}

        unless page.nil?
          params[:page] = page
        end

        unless per_page.nil?
          params[:per_page] = per_page
        end

        unless timeslot_start.nil?
          params[:timeslot_start] = timeslot_start
        end

        unless timeslot_end.nil?
          params[:timeslot_end] = timeslot_end
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

        unless event_campaign_id.nil?
          params[:event_campaign_id] = event_campaign_id.to_i
        end

        unless tag_ids.nil? || tag_ids.empty?
          params[:tag_id] = tag_ids.join(',')
        end

        unless event_types.nil? || event_types.empty?
          params[:event_types] = event_types.join(',')
        end

        unless is_virtual.nil?
          params[:is_virtual] = is_virtual ? 'true' : 'false'
        end

        unless exclude_full.nil?
          params[:exclude_full] = exclude_full ? 'true' : 'false'
        end

        get(path: "/organizations/#{esc(organization_id)}/events", params: params)
      end
    end

    def organization_event(organization_id:, event_id:)
      get(path: "/organizations/#{esc(organization_id)}/events/#{esc(event_id)}")
    end

    def organization_event_attendances(organization_id:, event_id:)
      get(path: "/organizations/#{esc(organization_id)}/events/#{esc(event_id)}/attendances")
    end

    def create_organization_event_attendance(organization_id:, event_id:, attendance_data:)
      post(path: "/organizations/#{esc(organization_id)}/events/#{esc(event_id)}/attendances", body: attendance_data)
    end
  end
end
