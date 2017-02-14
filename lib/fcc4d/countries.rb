module FCC4D
  class Countries 
    def initialize client
      @client = client
      @api_path = 'countries'
      @content_type = :json 
    end

    def ip ip
      @client.get @content_type, File.join(@api_path, 'ip', ip)
    end
  end
end
