require File.expand_path('../lib/turbolinks/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'turbolinks'
  s.version     = Turbolinks::VERSION
  s.author      = 'David Heinemeier Hansson'
  s.email       = 'david@loudthinking.com'
  s.license     = 'MIT'
  s.homepage    = 'https://github.com/turbolinks/turbolinks'
  s.summary     = 'Turbolinks makes navigating your web application faster'
  s.description = 'Rails engine for Turbolinks 5 support'
  s.files       = Dir["lib/turbolinks.rb", "lib/turbolinks/*.rb", "README.md", "LICENSE"]
  s.metadata = {
    "source_code_uri" => "https://github.com/turbolinks/turbolinks-rails",
  }

  s.add_dependency 'turbolinks-source', '~> 5.1'
end
