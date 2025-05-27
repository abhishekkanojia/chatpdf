lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'chatpdf/version'

Gem::Specification.new do |s|
  s.name        = "chatpdf"
  s.version     = Chatpdf::VERSION
  s.summary     = "[WIP] ChatPDF ruby gem around the ChatPDF API"
  s.description = "[WIP] Chatpdf is a ruby gem around the ChatPDF API"
  s.authors     = ["Abhishek Kanojia"]
  s.email       = "abhishek.kanojia3193@gmail.com" 
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir      = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.homepage    = "https://rubygems.org/gems/chatpdf"
  s.license       = "MIT"
end
