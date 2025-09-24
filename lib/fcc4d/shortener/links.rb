module FCC4D
  module Core
    module V2
      class Shortener
        class Links < Resource
          def create options = {} 
            params = {
              destination_url: options[:destination_url],
              domain_sid: options[:domain_sid],
              maximum_ttl: options[:maximum_ttl] || "-1",
            }
            if options[:short_name].present?
              params[:short_name] = options[:short_name]
            end

            reuse = options[:reuse] == false ? false : true
            client.post @content_type, api_path(nil, {reuse: reuse}), params
          end

        end
      end
    end
  end
end
