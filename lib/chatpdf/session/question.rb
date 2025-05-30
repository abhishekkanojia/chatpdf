require 'random/formatter'

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
    end
  end
end
