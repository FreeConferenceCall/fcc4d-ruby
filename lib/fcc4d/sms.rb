module FCC4D
  class SMS 
    def initialize client
      @client = client
      @api_path = 'sms'
      @content_type = :form 
    end

    def verification options = {}
      params = {
        from_did: options[:from_did],
        to_did: options[:to_did].to_s.gsub(/[^\d]/, ''),
        message: options[:message] || 'Your verification code is '
      }

      @client.post @content_type, File.join(@api_path, 'verification'), params

    end

    def create options = {}
      params = {
        from_did: options[:from_did],
        to_did: options[:to_did].to_s.gsub(/[^\d]/, ''),
        message: options[:message]
      }

      @client.post @content_type, File.join(@api_path, 'messages'), params
    end
  end
end
