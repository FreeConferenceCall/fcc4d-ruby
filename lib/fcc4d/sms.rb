module FCC4D
  module V2
    module API
      class SMS < Resource
        def verification options = {}
          params = {
            from_did: options[:from_did],
            to_did: options[:to_did].to_s.gsub(/[^\d]/, ''),
            message: options[:message] || 'Your verification code is '
          }

          client.post @content_type, api_path('verification'), params

        end

        def create options = {}
          params = {
            from_did: options[:from_did],
            to_did: options[:to_did].to_s.gsub(/[^\d]/, ''),
            message: options[:message]
          }

          client.post @content_type, api_path('messages'), params
        end
      end
    end
  end
end
