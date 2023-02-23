module MobilizeAmericaClient
  class Client
    module Attendances
      def organization_attendances(organization_id:, updated_since: nil)
        params = {}

        unless updated_since.nil?
          params[:updated_since] = updated_since.to_i
        end

        get(path: "/organizations/#{esc(organization_id)}/attendances", params: params)
      end
    end
  end
end
