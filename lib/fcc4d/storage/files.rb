module FCC4D
  module Core
    module V2
      class Storage
        class Files < Resource
          def upload file, options = {} 
            file_object = {
              type: options[:type],
              name: options[:name],
              container_sid: options[:container_sid],
              integer_key_1: options[:integer_key_1],
              integer_key_2: options[:integer_key_2],
              string_key_1: options[:string_key_1],
              string_key_2: options[:string_key_2],
              publish: options[:publish],
              file_access_name: options[:file_access_name],
              desired_format: options[:desired_format]
            }
            file_object[:lifecycle_action] = options[:lifecycle_action] if options[:lifecycle_action].present?
            file_object[:lifecycle_ttl] = options[:lifecycle_ttl] if options[:lifecycle_ttl].present?

            params = {
              data: file,
              file_object: file_object.to_json
            }
            client.post :multipart, api_path, params
          end

          def find sid
            client.get @content_type, api_path(sid)
          end

          def delete sid
            client.delete @content_type, api_path(sid)
          end

          def search options
            params = {
              offset: options[:offset] || 0,
              limit: options[:limit] || 0,
              filter: options[:filter],
              order: options[:order]
            }
            client.get @content_type, api_path(nil , params)
          end

          def patch sid, options, file = nil
            file_object = [
              :name, 
              :container_sid, 
              :integer_key_1, 
              :integer_key_2,
              :string_key_1,
              :string_key_2,
              :publish,
              :file_access_name
            ].inject({}) do |res, key|
              if options.keys.include? key
                res[key] = options[key]
              end
              res
            end

            params = {
              file_object: file_object.to_json
            }

            if file.present?
              content_type = :miltipart
              params[:file] = file if file.present?
            else
              content_type = :json
            end

            client.patch content_type, api_path(sid), params
          end
        end
      end
    end
  end
end
