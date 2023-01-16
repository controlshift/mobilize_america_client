module MobilizeAmericaClient
  class Client
    module Organizations
      def organizations(page: nil, per_page: nil, updated_since: nil, event_campaign_id: nil, tag_ids: nil, event_types: nil, max_dist: nil, is_virtual: nil, exclude_full: nil)
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

        unless event_campaign_id.nil?
          params[:event_campaign_id] = event_campaign_id.to_i
        end

        unless tag_ids.nil? || tag_ids.empty?
          params[:tag_id] = tag_ids
        end

        unless event_types.nil? || event_types.empty?
          params[:event_types] = event_types
        end

        unless max_dist.nil?
          params[:max_dist] = max_dist.to_i
        end

        unless is_virtual.nil?
          params[:is_virtual] = is_virtual ? 'true' : 'false'
        end

        unless exclude_full.nil?
          params[:exclude_full] = exclude_full ? 'true' : 'false'
        end

        get(path: "/organizations", params: params)
      end
    end
  end
end
