module Chatpdf
  class ResponseHandler
    def initialize(response)
      @response = response
    end

    def response_body
      @response
    end
  end
end
