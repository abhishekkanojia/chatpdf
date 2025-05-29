module Chatpdf
  module Actionable
    def add_pdf(file_path)
      Chatpdf::Api::FileUpload.new(self).add_pdf_via_upload(file_path)
    end

    def chat(source_id, messages)
      Chatpdf::Api::Chat.new(self).chat(
        source_id,
        messages
      )
    end

    def chat_with_reference(source_id, messages)
      Chatpdf::Api::Chat.new(self).chat_with_reference(
        source_id,
        messages
      )
    end

    def delete_source(source_ids = [])
      Chatpdf::Api::DeleteSource.new(self).delete_source(source_ids)
    end

    def chat_stream(source_id,messages)
      Chatpdf::Api::ChatStream.new(self).chat_stream(source_id, messages) do |chunk|
        yield chunk
      end
    end
  end
end
