module FCC4D
  module Flexml
    class V1
      class Calls < Resource
        def create options = {}
          params = options
          client.post @content_type, api_path, params
        end
      end
    end
  end
end
