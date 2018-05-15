module FCC4D
  module Core
    module V2
      class OAuth < Resource
        def token options = {}
          params = {
            grant_type: options[:grant_type],
            client_id: options[:client_id] || client.client_id,
            client_secret: options[:client_secret] || client.client_secret,
            username: options[:username],
            password: options[:password],
            refresh_token: options[:refresh_token],
            scope: 'trust' 
          }

          client.post @content_type, api_path('token', params), nil
        end

        def whoami
          client.get @content_type, api_path('whoami')
        end

        def token_for_subpartner partner_sid, options = {}
          params = {
            client_id: options[:client_id] || client.client_id,
            client_secret: options[:client_secret] || client.client_secret,
            scope: 'trust' 
          }

          client.post @content_type, api_path(['token', partner_sid], params), nil
        end

      end
    end
  end
end
