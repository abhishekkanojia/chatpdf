require 'httparty'

module Chatpdf
  class Client
    BASE_URL = "https://api.chatpdf.com/v1".freeze
    
    def initialize(api_key)
      @api_key = api_key
    end

    def add_pdf(file_path)
      Chatpdf::Api::FileUpload.new(self).add_pdf_via_upload(file_path)
    end

    def chat(source_id, messages)
      Chatpdf::Api::Chat.new(self).chat(
        source_id,
        messages
      )
    end

    def chat_with_reference(source_id, messages)
      Chatpdf::Api::Chat.new(self).chat_with_reference(
        source_id,
        messages
      )
    end

    def delete_source(source_ids = [])
      Chatpdf::Api::DeleteSource.new(self).delete_source(source_ids)
    end

    def chat_stream(source_id,messages)
      Chatpdf::Api::ChatStream.new(self).chat_stream(source_id, messages) do |chunk|
        yield chunk
      end
    end

    def request(path, options = {})
      HTTParty.post(
        endpoint(path),
        headers: headers,
        body: options[:body].to_json
      )
    end

    def upload_file(path, options = {})
      HTTParty.post(
        endpoint: endpoint(path),
        headers: { "x-api-key" => @api_key },
        body: options[:body]
      )
    end

    def endpoint(path)
      BASE_URL + path
    end

    def headers
      { "x-api-key" => @api_key, "Content-Type" => "application/json" }
    end
  end
end
