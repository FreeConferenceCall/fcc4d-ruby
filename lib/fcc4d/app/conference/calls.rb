module FCC4D
  module Core
    module V2
      class App
        class Conference
          class Calls < Resource
            def get options = {} 
              params = options
              client.get @content_type, api_path(nil, params)
            end

            def find sid
              client.get @content_type, api_path(sid)
            end
          end
        end
      end
    end
  end
end
