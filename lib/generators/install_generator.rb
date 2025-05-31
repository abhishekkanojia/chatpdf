module Chatpdf
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def create_initializer_file
        create_file "config/initializers/chatpdf_initializer.rb", <<~FILE
          Chatpdf.config do |config|
            config.api_key = ENV['CHATPDF_API_KEY']
          end
        FILE
      end

    end
  end
end
