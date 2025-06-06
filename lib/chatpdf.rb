# frozen_string_literal: true

require 'chatpdf/version'
require 'chatpdf/configuration'
require 'chatpdf/concerns/actionable'
require 'chatpdf/client'
require 'chatpdf/api/base'
require 'chatpdf/api/file_upload'
require 'chatpdf/api/chat'
require 'chatpdf/api/delete_source'
require 'chatpdf/api/chat_stream'
require 'chatpdf/exceptions/invalid_session_initialization'
require 'chatpdf/exceptions/invalid_configuration'
require 'chatpdf/session/question'
require 'chatpdf/session/answer'
require 'chatpdf/session/conversation'
require 'chatpdf/message'
require 'chatpdf/response_handler'

begin
  require "chatpdf/railtie" if defined?(Rails::Railtie)
rescue LoadError
  # Rails is not present
end

module Chatpdf
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
    configuration
  end
end
