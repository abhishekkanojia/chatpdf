require 'httparty'

module Chatpdf
  class Client
    BASE_URL = "https://api.chatpdf.com/v1".freeze
    
    include Chatpdf::Actionable
    
    def initialize(api_key)
      @api_key = api_key
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
        endpoint(path),
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
