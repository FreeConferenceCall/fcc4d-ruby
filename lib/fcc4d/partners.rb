module FCC4D
  module Core
    module V2
      class Partners < Resource
        def create options = {}
          params = {
            login: options[:login],
            password: options[:password],
            name: options[:name], 
            address1: options[:address1],
            address2: options[:address2],
            city: options[:city],
            state: options[:state],
            zip: options[:zip],
            country_code: options[:country_code],
            payment_type: options[:payment_type],
            prepay_amount: options[:prepay_amount],
            charge_at: options[:charge_at],
            owner_email: options[:owner_email],
            billing_email: options[:billing_email],
            tech_email: options[:tech_email],
            company_name: options[:company_name],
            phonenumber: options[:phonenumber],
            attributes: options[:attributes]
          }

          if options[:verification_token].present?
            request_path = api_path(nil, verification_token: options[:verification_token])
          else
            request_path = api_path
          end

          client.post @content_type, request_path, params
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

        def patch sid, options
          params = {
            password: options[:password]
          }
          client.patch @content_type, api_path(sid), params

        end
      end
    end
  end
end
