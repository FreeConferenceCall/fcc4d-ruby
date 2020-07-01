module FCC4D
  module Conference
    class V1
      def initialize client
        @client = client
      end

      def call_flows
        @callflows ||= CallFlows.new @client
      end

      def cdrs
        @cdrs ||= Cdrs.new @client
      end

      def did_groups
        @didgroups ||= DidGroups.new @client
      end

      def meeting_rooms
        @meetingrooms ||= MeetingRooms.new @client
      end

      def meetings
        @meetings ||= Meetings.new @client
      end
    end
  end
end
