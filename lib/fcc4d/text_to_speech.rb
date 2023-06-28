# frozen_string_literal: true

module FCC4D
  module Core
    module V2
      class TextToSpeech < Resource
        def create response_container_sid, options = {}
          params = {
            text:      options[:text],
            format:    options[:format],
            voice_sid: options[:voice_sid]
          }
          client.post(
            @content_type, api_path(nil, response_format: 'file', response_container_sid:), params
          )
        end
      end
    end
  end
end
