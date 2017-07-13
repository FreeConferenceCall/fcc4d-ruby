module FCC4D
  module Core
    module V2
      class Storage
        class Files < Resource
          def upload file, options = {} 
            file_object = {
              name: options[:name],
              container_sid: options[:container_sid],
              integer_key_1: options[:integer_key_1],
              integer_key_2: options[:integer_key_2],
              string_key_1: options[:string_key_1],
              string_key_2: options[:string_key_2],
              publish: options[:publish],
              file_access_name: options[:file_access_name]
            }
            params = {
              data: file,
              file_object: file_object.to_json
            }
            client.post :multipart, api_path, params
          end

          def find sid
            client.post @content_type, api_path(sid)
          end
        end
      end
    end
  end
end
