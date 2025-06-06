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
        return [] if @references.nil?
        
        @references.map { |reference| reference[PAGE_NUMBER_KEY] }
      end

      def serialise
        {
          id: id,
          content: content,
          references: references
        }
      end
    end
  end
end
