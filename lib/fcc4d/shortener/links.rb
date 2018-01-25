module FCC4D
  module Core
    module V2
      class Shortener
        class Links < Resource
          def create options = {} 
            params = {
              destination_url: options[:destination_url],
              domain_sid: options[:domain_sid],
              maximum_ttl: options[:maximum_ttl] || "-1"
            }
            client.post @content_type, api_path, params
          end

        end
      end
    end
  end
end
