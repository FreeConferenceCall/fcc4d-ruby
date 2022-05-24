module FCC4D
  module Core
    module V2
      class App
        class Conference
          def initialize client
            @client = client
          end

          def calls
            @calls ||= Calls.new @client
          end

          def meetings
            @meetings ||= Meetings.new @client
          end
        end
      end
    end
  end
end
