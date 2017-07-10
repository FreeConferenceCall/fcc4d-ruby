module FCC4D
  module Core
    module V2
      class Storage
        def initialize client
          @client = client
        end

        def containers
          @containers ||= Containers.new @client
        end

        def files
          @files ||= Files.new @client
        end
      end
    end
  end
end
