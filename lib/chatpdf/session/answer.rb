module Chatpdf
  module Session
    class Answer
      @@_id = 0

      attr_reader :id, :content, :references

      def initialize(response = {})
        @content = response["content"]
        @references = response["references"]
        @@_id = Random.uuid
        @id = @@_id
      end

      def to_s
        @content
      end
    end
  end
end
