module Chatpdf
  module Api
    class FileUpload < Chatpdf::Api::Base
      def add_pdf_via_upload(file_path)
        file = File.new(file_path ,'rb')
        response = client.upload_file("/sources/add-file", {
          body: {
            file: file
          }
        })
        file.close

        ResponseHandler.new(response).response_body
      end

      def add_pdf_via_url(url)
        response = client.request("/sources/add-url", {
          body: {
            url: url
          }
        })
        
        ResponseHandler.new(response).response_body
      end
    end
  end
end
