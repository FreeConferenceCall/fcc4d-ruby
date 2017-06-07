module FCC4D
  module V2
    module API
      class Verification
        class Email < Resource
          def create options = {} 
            params = {
              to_address: options[:to_address],
              partner_sid: options[:partner_sid],
              email_template_sid: options[:email_template_sid],
              base_url: options[:base_url]
            }
            client.post @content_type, api_path, params
          end

          def tokens token 
            client.get @content_type, api_path(['tokens', token])
          end

          def templates options = {}
            params = {
              offset: options[:offset] || 0,
              limit: options[:limit] || 0,
              filter: options[:filter],
              order: options[:order]
            }
            client.get @content_type, api_path('templates', params)
          end
        end

        def initialize client
          @client = client
        end

        def email
          @email ||= Email.new @client
        end
      end
    end
  end
end
