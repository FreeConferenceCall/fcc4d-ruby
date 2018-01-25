module FCC4D
  module Core
    module V2
      class Shortener
        def initialize client
          @client = client
        end

        def links
          @links ||= Links.new @client
        end

      end
    end
  end
end
