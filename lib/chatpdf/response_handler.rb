module Chatpdf
  class ResponseHandler
    def initialize(response)
      @response = response
    end

    def success?
      @response.ok?
    end

    def response_body
      @response.parsed_response
    end
  end
end
