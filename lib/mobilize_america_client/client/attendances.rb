module MobilizeAmericaClient
  class Client
    module Attendances
      def organization_attendances(organization_id:, updated_since: nil, cursor: nil, page: nil, per_page: nil)
        params = {}

        unless updated_since.nil?
          params[:updated_since] = updated_since.to_i
        end

        unless cursor.nil?
          params[:cursor] = cursor
        end

        unless page.nil?
          params[:page] = page
        end

        unless per_page.nil?
          params[:per_page] = per_page
        end

        get(path: "/organizations/#{esc(organization_id)}/attendances", params: params)
      end
    end
  end
end
