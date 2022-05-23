module FCC4D
  module Conference
    class V2
      class Meetings < Resource
        def find meeting_sid
          client.get @content_type, api_path(meeting_sid)
        end

        def search options
          params = {
            offset: options[:offset] || 0,
            limit: options[:limit] || 0,
            order: options[:order]
          }
          params[:filter] = options[:filter] if options[:filter]
          params[:meeting_room_sid] = options[:meeting_room_sid] if options[:meeting_room_sid]
          client.get @content_type, api_path(nil , params)
        end

        def delete meeting_sid
          client.delete @content_type, api_path(meeting_sid)
        end
      end
    end
  end
end
