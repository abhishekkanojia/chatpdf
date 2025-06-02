module Chatpdf
  module Actionable
    module InstanceMethods
      def add_pdf(file_path)
        Chatpdf::Api::FileUpload.new(self).add_pdf_via_upload(file_path)
      end

      def add_pdf_via_url(url)
        Chatpdf::Api::FileUpload.new(self).add_pdf_via_url(url)
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

      def chat_stream(source_id, messages)
        Chatpdf::Api::ChatStream.new(self).chat_stream(source_id, messages) do |chunk|
          yield chunk
        end
      end
    end

    def self.included(klass)
      klass.send(:include, InstanceMethods)
    end
  end
end
