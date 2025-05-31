module Chatpdf
  class InvalidConfiguration < StandardError
    def initialize(message)
      super(message)
    end
  end
end
