module FCC4D
  module Conference
    class V1
      class MeetingRooms < Resource
        def initialize client, options = {}
          super(client, resource_path: 'conference/v1/meetingRooms')
        end

        def get options = {} 
          client.get @content_type, api_path
        end

        def create options = {}
          params = options
          client.post @content_type, api_path, params
        end
      end
    end
  end
end
