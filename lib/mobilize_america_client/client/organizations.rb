module MobilizeAmericaClient
  class Client
    module Organizations
      def organizations(page: nil, cursor: nil, per_page: nil, updated_since: nil)
        params = {}

        unless cursor.nil?
          params[:cursor] = cursor
        end

        unless page.nil?
          params[:page] = page
        end

        unless per_page.nil?
          params[:per_page] = per_page
        end

        unless updated_since.nil?
          params[:updated_since] = updated_since.to_i
        end

        get(path: "/organizations", params: params)
      end
    end
  end
end
