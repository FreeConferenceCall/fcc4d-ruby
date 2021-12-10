module FCC4D
  module Flexml
    class V1
      def initialize client
        @client = client
      end

      def calls
        @calls ||= Calls.new @client
      end
    end
  end
end
