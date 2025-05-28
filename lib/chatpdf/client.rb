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

    def request(path, options = {})
      HTTParty.post(
        BASE_URL + path,
        headers: { "x-api-key" => @api_key },
        body: options[:body]
      )
    end
  end
end
