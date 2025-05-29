require 'net/http'
require 'uri'
require 'json'

module Chatpdf
  module Api
    class ChatStream < Chatpdf::Api::Base
      def chat_stream(source_id, messages = [])
        uri = URI.parse(client.endpoint("/chats/message"))
        request = Net::HTTP::Post.new(uri, client.headers)
        request.body = {
          sourceId: source_id,
          messages: messages,
          stream: true
        }.to_json
        
        Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
          http.request(request) do |response|
            response.read_body do |chunk|
              yield chunk
            end
          end
        end
      end
    end
  end
end
