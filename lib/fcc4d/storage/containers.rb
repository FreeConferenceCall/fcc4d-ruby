module FCC4D
  module Core
    module V2
      class Storage
        class Containers < Resource
          def create options = {} 
            params = {
              unique: options[:unique] || 'false',
              parent_container_sid: options[:parent_container_sid],
              quota_files: options[:quota_files],
              quota_bytes: options[:quota_bytes],
              integer_key_1: options[:integer_key_1],
              integer_key_2: options[:integer_key_2],
              string_key_1: options[:string_key_1],
              string_key_2: options[:string_key_2],
            }
            client.post @content_type, api_path, params
          end

          def find sid
            client.post @content_type, api_path(sid)
          end

          def patch sid, options
            params = {}
            params[:integer_key_1] = options[:integer_key_1] if options[:integer_key_1]
            params[:integer_key_2] = options[:integer_key_2] if options[:integer_key_2]
            params[:string_key_1] = options[:string_key_1] if options[:string_key_1]
            params[:string_key_2] = options[:string_key_2] if options[:string_key_2]
            client.patch @content_type, api_path(sid), params
          end
        end
      end
    end
  end
end
