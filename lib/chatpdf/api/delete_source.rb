module Chatpdf
  module Api
    class DeleteSource < Chatpdf::Api::Base
      def delete_source(source_ids = [])
        client.request("/sources/delete", {
          body: {
            sources: source_ids
          }
        })

        ResponseHandler.new(response).response_body
      end
    end
  end
end
