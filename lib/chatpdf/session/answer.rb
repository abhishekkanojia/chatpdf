module Chatpdf
  module Session
    class Answer
      PAGE_NUMBER_KEY = "pageNumber".freeze
      @@_id = 0

      attr_reader :id, :content

      def initialize(response = {})
        @content = response["content"]
        @references = response["references"]
        @@_id = Random.uuid
        @id = @@_id
      end

      def to_s
        @content
      end

      def references
        @references.map { |reference| reference[PAGE_NUMBER_KEY] }
      end
    end
  end
end
