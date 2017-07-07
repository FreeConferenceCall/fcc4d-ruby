module FCC4D
  module Core
    module V2
      class Lookup < Resource
        def dids did, options = {}
          client.get @content_type, api_path(['dids', did])
        end
      end
    end
  end
end
