module FCC4D
  module Conference
    class V2
      class MeetingRooms < Resource
        def initialize client, options = {}
          super(client, resource_path: 'conference/v2/meeting_rooms')
        end

        def get options = {} 
          client.get @content_type, api_path
        end

        def create options = {}
          params = options
          client.post @content_type, api_path, params
        end

        def find meeting_number
          client.get @content_type, api_path(meeting_number)
        end

        def delete meeting_number
          client.delete @content_type, api_path(meeting_number)
        end
      end
    end
  end
end
