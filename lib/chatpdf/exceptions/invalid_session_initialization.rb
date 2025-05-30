module Chatpdf
  class InvalidSessionInitialization < StandardError
    def initialize(message)
      super(message)
    end
  end
end
