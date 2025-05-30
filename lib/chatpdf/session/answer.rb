module Chatpdf
  module Session
    class Answer
      @@_id = 0

      attr_reader :id, :content

      def initialize(content)
        @content = content
        @@_id = Random.uuid
        @id = @@_id
      end

      def to_s
        @content
      end
    end
  end
end
