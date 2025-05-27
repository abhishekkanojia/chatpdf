module Chatpdf
  class Client
    BASE_URL = "https://api.chatpdf.com/".freeze
    
    def initialize(api_key)
      @api_key = api_key
    end

    def request(path, options = {})
      HTTParty.post(
        BASE_URL + path,
        headers: { "Authorization" => "Bearer #{@api_key}" },
        body: options[:body]
      )
    end
  end
end
