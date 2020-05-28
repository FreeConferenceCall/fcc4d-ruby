module FCC4D
  module Conference
    class V1
      class Meetings < Resource
        def initialize client, options = {}
          super(client, resource_path: 'conference/v1/meetings')
        end

        def find meeting_number
          client.get @content_type, api_path(meeting_number)
        end

        def delete meeting_number
          client.delete @content_type, api_path(meeting_number)
        end

        def put meeting_number, options
          params = {}
          params[:isRecording] = options[:isRecording]
          client.put @content_type, api_path(meeting_number), params
        end
      end
    end
  end
end
