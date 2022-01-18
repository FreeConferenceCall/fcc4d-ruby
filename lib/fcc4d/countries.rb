module FCC4D
  module Core
    module V2
      class Countries < Resource
        def ip ip
          client.get @content_type, api_path(['ip', ip])
        end

        def search options
          params = {
            offset: options[:offset] || 0,
            limit: options[:limit] || 0,
            filter: options[:filter],
            order: options[:order]
          }
          client.get @content_type, api_path(nil , params)
        end
      end
    end
  end
end
