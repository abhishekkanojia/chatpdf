module Chatpdf
  module Session
    class Conversation
      attr_reader :file_path, :url, :source_id, :questions

      def initialize(file_path: nil, url: nil, source_id: nil)
        @file_path = file_path
        @url = url
        @questions = []
        @source_id = source_id
        validate_params
      end

      def ask(question, references: false)
        add_pdf if source_id.nil?

        question = Question.new(question)
        @questions << question

        response = client.chat(source_id, [Chatpdf::Message.new("#{question}").to_h]) unless references
        response = client.chat_with_reference(source_id, [Chatpdf::Message.new("#{question}").to_h]) if references

        question.answer = Answer.new(response)

        question.answer.to_s
      end

      def serialise
        {
          file_path: file_path,
          url: url,
          source_id: source_id,
          questions: questions.map(&:serialise)
        }
      end

      private

      def client
        @client ||= Chatpdf::Client.new
      end

      def add_pdf
        if file_path
          response = client.add_pdf(file_path)
        elsif url
          response = client.add_pdf_via_url(url)
        else
          raise Chatpdf::InvalidSessionInitialization, "Either file_path or url or source_id must be provided"
        end

        @source_id = response["sourceId"]
        @source_id
      end

      def validate_params
        if !@source_id.nil? && (!@file_path.nil? || !@url.nil?)
          raise Chatpdf::InvalidSessionInitialization, "Invalid parameters: source_id cannot be provided if file_path or url is provided"
        end

        if @file_path.nil? && @url.nil? && @source_id.nil?
          raise Chatpdf::InvalidSessionInitialization, "Either file_path or url or source_id must be provided"
        end
      end
    end
  end
end
