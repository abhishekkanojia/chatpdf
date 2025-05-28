# frozen_string_literal: true

require 'chatpdf/client'
require 'chatpdf/version'

require 'chatpdf/api/base'
require 'chatpdf/api/file_upload'

require 'chatpdf/response_handler'

Gem.find_files("chatpdf/**/*.rb").each { |path| require_relative path }


module Chatpdf
  class Error < StandardError; end
  # Your code goes here...
end
