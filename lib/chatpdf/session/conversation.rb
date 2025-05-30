module Chatpdf
  module Session
    class Conversation
      attr_reader :file_path, :url, :source_id

      def initialize(file_path: nil, url: nil)
        @file_path = file_path
        @url = url
        @questions = []
        @source_id = nil
      end

      def ask(question)
        validate_params
        add_pdf if source_id.nil?

        question = Question.new(question)
        @questions << question

        response = client.chat(source_id, [Chat::Message.new("#{question}").to_h])
        question.answer = Answer.new(response["content"])
        
        question.answer.to_s
      end

      def questions
        @questions.map(&:to_s)
      end

      def answers
        questions.map { |question| question.answer.to_s }
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
        end

        @source_id = response["source_id"]
        @source_id
      end

      def validate_params
        if @file_path.nil? && @url.nil?
          raise "Either file_path or url must be provided"
        end
      end
    end
  end
end
