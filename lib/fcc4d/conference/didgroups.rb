module FCC4D
  module Conference
    class V1
      class DidGroups < Resource
        def initialize client, options = {}
          super(client, resource_path: 'conference/v1/didGroups')
        end

        def  get options = {} 
          client.get @content_type, api_path
        end

        def find id
          client.get @content_type, api_path(id)
        end
      end
    end
  end
end
