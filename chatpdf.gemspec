Gem::Specification.new do |s|
  s.name        = "chatpdf"
  s.version     = Chatpdf::VERSION
  s.summary     = "ChatPDF ruby gem around the ChatPDF API"
  s.description = "Chatpdf is a ruby gem around the ChatPDF API"
  s.authors     = ["Abhishek Kanojia"]
  s.email       = "abhishek.kanojia3193@gmail.com" 
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir      = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.homepage    = "https://rubygems.org/gems/chatpdf"
  s.license       = "MIT"
end
