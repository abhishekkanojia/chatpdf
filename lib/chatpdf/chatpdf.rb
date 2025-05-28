require 'chatpdf/client'
require 'chatpdf/version'
require 'chatpdf/api/file_upload'
require 'chatpdf/api/base'
require 'chatpdf/response_handler'

Gem.find_files("chatpdf/**/*.rb").each { |path| require_relative path }

require 'chatpdf/response_handler'

module Chatpdf
end
