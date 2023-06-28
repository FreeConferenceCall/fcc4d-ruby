# frozen_string_literal: true

module FCC4D
  class Client
    attr_reader :client_id, :client_secret

    def initialize options = {}
      @auth_token = options[:auth_token]
      @token_type = (options[:token_type] || 'bearer').to_s.capitalize
      @username = options[:username]
      @password = options[:password]
      @uri = URI(options[:endpoint] || 'https://api.carrierx.com')
      @client_id = options[:client_id]
      @client_secret = options[:client_secret]
      @debug_http = options[:debug_http]
      @timeout = options[:timeout].to_i
      @middlewares = options[:middlewares]
    end

    def sms
      @sms ||= FCC4D::Core::V2::SMS.new self
    end

    def push
      @push ||= FCC4D::Core::V2::Push.new self
    end

    def lookup
      @lookup ||= FCC4D::Core::V2::Lookup.new self
    end

    def countries
      @countries ||= FCC4D::Core::V2::Countries.new self
    end

    def oauth
      @oauth ||= FCC4D::Core::V2::OAuth.new self, content_type: :form
    end

    def partners
      @partners ||= FCC4D::Core::V2::Partners.new self
    end

    def verification
      @verification ||= FCC4D::Core::V2::Verification.new self
    end

    def storage
      @storage ||= FCC4D::Core::V2::Storage.new self
    end

    def shortener
      @shortener ||= FCC4D::Core::V2::Shortener.new self
    end

    def text_to_speech
      @text_to_speech ||= FCC4D::Core::V2::TextToSpeech.new(self, resource_path: '/core/v2/tts/texts')
    end

    def conference
      @conference ||= FCC4D::Conference::V1.new self
    end

    def conference_v2
      @conference_v2 ||= FCC4D::Conference::V2.new self
    end

    def flexml
      @flexml ||= FCC4D::Flexml::V1.new self
    end

    def mediator
      @mediator ||= FCC4D::Mediator::V1.new self
    end

    def app
      @app ||= FCC4D::Core::V2::App.new self
    end

    def get content_type, api_call_path
      api_call content_type, :get, api_call_path, nil
    end

    def post content_type, api_call_path, data = nil
      api_call content_type, :post, api_call_path, data
    end

    def post_without_authorization content_type, api_call_path, data = nil
      api_call content_type, :post, api_call_path, data, authorization: false
    end

    def put content_type, api_call_path, data
      api_call content_type, :put, api_call_path, data
    end

    def patch content_type, api_call_path, data
      api_call content_type, :patch, api_call_path, data
    end

    def delete content_type, api_call_path
      api_call content_type, :delete, api_call_path, nil
    end

    private

    def api_call content_type, request_method, api_call_path, data, options = {}
      data = data.to_json if data && content_type == :json

      connection = Faraday.new(url: @uri.scheme + '://' + @uri.host) do |f|
        @middlewares&.each { |middleware| f.use middleware }
        if content_type == :multipart
          f.request content_type
        else
          f.request :url_encoded
        end
        f.response(:logger, ::Logger.new(STDOUT), bodies: true) if @debug_http == true
        f.adapter Faraday.default_adapter
        f.headers = headers[content_type]
        f.options.open_timeout = @timeout
        f.options.timeout = @timeout

        if options[:authorization] != false && !@auth_token && @username && @password
          f.request :authorization, :basic, @username, @password
        end
        f.adapter :net_http_persistent
      end

      api_call = [request_method, api_call_path]
      api_call << data unless request_method == :get

      response = connection.send(*api_call)

      if response.body && !response.body.empty?
        object = JSON.parse response.body
      elsif response.status == 204
        object = {}
      elsif response.status == 400
        object = { message: 'Bad request', code: 400 }.to_json
      end

      object
    end

    def headers
      @headers ||= {
        json: base_headers.merge('Content-Type' => 'application/json'),
        form: base_headers.merge('Content-Type' => 'application/x-www-form-urlencoded'),
        multipart: base_headers.merge('Content-Type' => 'multipart/form-data')
      }
    end

    def base_headers
      @base_headers ||= {
        'Accept' => 'application/json'
      }.merge(authorization_header)
    end

    def authorization_header
      if @auth_token
        {'Authorization' => "#@token_type #@auth_token"}
      else
        {}
      end
    end

  end
end
