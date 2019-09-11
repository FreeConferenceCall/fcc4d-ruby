module FCC4D
  module Mediator
    class V1
      def initialize client
        @client = client
      end

      def bindings
        @bindings ||= Bindings.new @client
      end
    end
  end
end
