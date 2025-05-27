module Chatpdf
  class ResponseHandler
    def initialize(response)
      @response = response
    end

    def success?
      @response.code == 200
    end

    def response_body
      JSON.parse(@response.body)
    end
  end
end
