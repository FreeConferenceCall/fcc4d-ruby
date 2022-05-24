module FCC4D
  module Core
    module V2
      class App
        def initialize client
          @client = client
        end

        def conference
          @conference ||= Conference.new @client
        end
      end
    end
  end
end
