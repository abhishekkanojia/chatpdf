module Chatpdf
  module API
    class Base
      attr_reader :client
      
      def initialize
        @client = Chatpdf::Client.new
      end
    end
  end
end
