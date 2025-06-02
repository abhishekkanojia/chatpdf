require 'rails/railtie'

module Chatpdf
  class Railtie < ::Rails::Railtie
    generators do
      require 'generators/chatpdf/install/install_generator'
    end
  end
end
