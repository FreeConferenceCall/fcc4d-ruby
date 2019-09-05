module FCC4D
  module Conference
    class V1
      class CallFlows < Resource
        def initialize client, options = {}
          super(client, resource_path: 'conference/v1/callFlows')
        end

        def  get options = {} 
          client.get @content_type, api_path(nil, excludeFields: 'attributeTemplates')
        end
      end
    end
  end
end
