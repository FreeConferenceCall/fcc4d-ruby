module FCC4D
  module Mediator
    class V1
      class Bindings < Resource
        def create options = {}
          params = options
          client.post @content_type, api_path, params
        end
      end
    end
  end
end
