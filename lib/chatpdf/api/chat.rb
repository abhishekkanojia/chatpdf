module Chatpdf
  module Api
    class Chat < Chatpdf::Api::Base
      def chat(source_id, messages = [])
        response = client.request("/chats/message", {
          body: {
            sourceId: source_id,
            messages: messages
          }
        })

        ResponseHandler.new(response).response_body
      end

      def chat_with_reference(source_id, messages = [])
        response = client.request("/chats/message", {
          body: {
            referenceSources: true,
            sourceId: source_id,
            messages: messages
          }
        })
        ResponseHandler.new(response).response_body
      end
    end
  end
end
