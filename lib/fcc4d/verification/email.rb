module FCC4D
  module V2
    module API
      class Verification
        class Email < Resource
          def create options = {} 
            params = {
              to_address: options[:to_address],
              email_template_sid: options[:email_template_sid],
              base_url: options[:base_url]
            }
            client.post @content_type, api_path('send'), params
          end

          def check token 
            client.post @content_type, api_path(['check', token])
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
