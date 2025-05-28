module Chatpdf
  module API
    class FileUpload < Base
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
