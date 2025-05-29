module Chatpdf
  class Message
    def initialize(content, role: "user", stream: false)
      @content = content
      @role = role
      @stream = stream
    end

    def to_h
      default = {
        role: @role,
        content: @content,
      }
      
      default.merge(stream: @stream) if @stream

      default
    end
  end
end
