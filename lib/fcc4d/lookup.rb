module FCC4D
  class Lookup 
    def initialize client
      @client = client
      @api_path = 'lookup'
      @content_type = :json 
    end

    def dids did, options = {}
      @client.get @content_type, File.join(@api_path, 'dids', did)
    end
  end
end
