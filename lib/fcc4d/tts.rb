module FCC4D
  module Core
    module V2
      class Tts
        def initialize client
          @client = client
        end

        def texts
          @texts ||= Texts.new @client
        end
      end
    end
  end
end
