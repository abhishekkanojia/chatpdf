require 'httparty'

module Chatpdf
  class Client
    BASE_URL = "https://api.chatpdf.com/v1".freeze
    
    def initialize(api_key)
      @api_key = api_key
    end

    def file_upload(file_path)
      Chatpdf::Api::FileUpload.new(self).add_pdf_via_upload(file_path)
    end

    def chat(source_id, messages, reference: true)
      Chatpdf::Api::Chat.new(self).chat(
        source_id,
        messages,
        reference: reference
      )
    end

    def chat_stream(messages)
      Chatpdf::Api::ChatStream.new(self).chat_stream(messages)
    end

    def request(path, options = {})
      HTTParty.post(
        endpoint(path),
        headers: { "x-api-key" => @api_key },
        body: options[:body]
      )
    end

    def endpoint(path)
      BASE_URL + path
    end
  end
end
