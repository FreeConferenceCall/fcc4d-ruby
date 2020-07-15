module FCC4D
  module Conference
    class V1
      class Mdrs < Resource
        def initialize client, options = {}
          super(client, resource_path: 'conference/v1/mdrs')
        end

        def get options = {} 
          params = options
          client.get @content_type, api_path(nil, params)
        end
      end
    end
  end
end
