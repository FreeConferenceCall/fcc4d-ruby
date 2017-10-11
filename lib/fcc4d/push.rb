module FCC4D
  module Core
    module V2
      class Push < Resource
        def notification recipients, options = {}
          params = {
            recipients: [*recipients],
            ttl: options[:ttl] || 60,
            priority: options[:priority],
            title: options[:title],
            body: options[:body],
            data: options[:data],
            notification_sid: options[:notification_sid],
            ios_sound: options[:ios_sound],
            ios_badge: options[:ios_badge],
            ios_category: options[:ios_category],
            android_sound: options[:android_sound],
            android_icon: options[:android_icon],
            android_click_action: options[:android_click_action]
          }
          client.post @content_type, api_path('notifications'), params
        end

        def add_device data
          client.post @content_type, api_path('devices'), data
        end

        def update_device device_id, data
          client.patch @content_type, api_path(['devices', device_id]), data
        end
      end
    end
  end
end
