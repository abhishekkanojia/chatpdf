lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'chatpdf/version'

Gem::Specification.new do |s|
  s.name        = "chatpdf"
  s.version     = Chatpdf::VERSION
  s.summary     = "ChatPDF ruby gem around the ChatPDF API"
  s.description = "Chatpdf is a ruby gem around the ChatPDF API"
  s.authors     = ["Abhishek Kanojia"]
  s.email       = "abhishekka3193@gmail.com"
  s.homepage    = "https://github.com/abhishekkanojia/chatpdf"
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir      = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.homepage    = "https://rubygems.org/gems/chatpdf"
  s.license       = "MIT"
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 3.12.0"
  
  s.add_dependency "httparty", '~> 0.23.1'
end
