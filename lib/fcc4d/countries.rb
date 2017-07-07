module FCC4D
  module Core
    module V2
      class Countries < Resource
        def ip ip
          client.get @content_type, api_path(['ip', ip])
        end
      end
    end
  end
end
