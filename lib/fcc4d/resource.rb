module FCC4D
  class Resource
    attr_reader :client

    def initialize client, options = {}
      @client = client
      @resource_path = options[:resource_path] || resource_path
      @content_type = options[:content_type] || :json
    end

    def api_path location = nil, query_params = nil 
      path = @resource_path
      if location
        path = File.join(path, location)
      end
      if query_params.is_a? Hash
        path += '?' + URI.encode_www_form(query_params)
      end
      path
    end

    def resource_path
      File.join(self.class.name.to_s.split('::')[1..-1].map(&:downcase))
    end
  end
end
