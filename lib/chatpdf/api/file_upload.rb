module Chatpdf
  module Api
    class FileUpload < Chatpdf::Api::Base
      def add_pdf_via_upload(file_path)
        file = File.new(file_path ,'rb')
        response = client.request("/sources/add-file", {
          body: {
            file: file
          }
        })

        ResponseHandler.new(response).response_body
      end
    end
  end
end
