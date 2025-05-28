module Chatpdf
  module Api
    class Base
      attr_reader :client
      
      def initialize
        @client = Chatpdf::Client.new
      end
    end
  end
end
