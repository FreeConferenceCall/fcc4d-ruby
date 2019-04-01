module FCC4D
  module Core
    module V2
      class OAuth < Resource
        def token options = {}
          params = { 
            client_id: options[:client_id] || client.client_id,
            client_secret: options[:client_secret] || client.client_secret
          }

          params[:grant_type] = options[:grant_type] if options[:grant_type].present?
          params[:username] = options[:username] if options[:username].present?
          params[:password] = options[:password] if options[:password].present?
          params[:refresh_token] = options[:refresh_token] if options[:refresh_token].present?

          client.post_without_authorization @content_type, api_path('token'), params
        end

        def whoami
          client.get @content_type, api_path('whoami')
        end

        def token_for_subpartner partner_sid, options = {}
          params = {
            client_id: options[:client_id] || client.client_id,
            client_secret: options[:client_secret] || client.client_secret,
            scope: options[:scope]
          }

          if options[:name].present?
            params[:name] = options[:name]
          end

          client.post @content_type, api_path(['token', partner_sid]), params
        end

        def revoke_token token, options = {}
          params = {
            client_id: options[:client_id] || client.client_id,
            client_secret: options[:client_secret] || client.client_secret,
            token: token
          }

          client.post @content_type, api_path('revoke', params)
        end

      end
    end
  end
end
