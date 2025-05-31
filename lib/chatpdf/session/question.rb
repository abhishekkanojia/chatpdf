module Chatpdf
  module Session
    class Question
      @@_id = 0

      attr_reader :id
      attr_accessor :answer

      def initialize(question)
        @question = question
        @@_id = Random.uuid
        @id = @@_id
        @answer = nil
      end

      def to_s
        @question
      end

      def serialise
        {
          id: id,
          question: question,
          answer: answer.serialise
        }
      end
    end
  end
end
