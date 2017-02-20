module FCC4D
  module V2
    module API
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
            payment_type: options[:payment_type]
          }

          client.post @content_type, api_path, params
        end
      end
    end
  end
end
