module FCC4D
  module Core
    module V2
      class Push < Resource
        def notification recipients, options = {}
          params = {
            recipients: [*recipients],
            message: options[:message],
            ttl: options[:ttl] || 60,
            priority: options[:priority]
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
