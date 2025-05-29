module Chatpdf
  module Api
    class Chat < Chatpdf::Api::Base
      def chat(source_id, messages = [], referenceSources: true)
        client.request("/chats/message", {
          body: {
            sourceId: source_id,
            messages: messages
          }
        })
      end
    end
  end
end
