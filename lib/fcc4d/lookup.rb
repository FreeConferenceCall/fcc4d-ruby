module FCC4D
  module Core
    module V2
      class Lookup < Resource
        def dids did, options = {}
          params = options
          client.get @content_type, api_path(['dids', did], params)
        end

        def ip_addresses ip
          client.get @content_type, api_path(['ip_addresses', ip])
        end
      end
    end
  end
end
