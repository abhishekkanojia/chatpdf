module Chatpdf
  module Api
    class FileUpload < Chatpdf::Api::Base
      def add_pdf_via_upload(file_path)
        file = File.new(file_path)
        response = client.request("/sources/add-file", {
          body: {
            file: file
          }
        })

        ResponseHandler.new(response)
      end
    end
  end
end
