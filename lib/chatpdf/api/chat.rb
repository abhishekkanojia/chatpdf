module Chatpdf
  module Api
    class Chat < Chatpdf::Api::Base
      def chat(source_id, messages = [], reference: true)
        response = client.request("/chats/message", {
          body: {
            referenceSources: reference,
            sourceId: source_id,
            messages: messages
          }
        })

        ResponseHandler.new(response).response_body
      end
    end
  end
end
