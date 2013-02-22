# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'glasstrip/version'

Gem::Specification.new do |gem|
  gem.name          = "GlassTrip"
  gem.version       = GlassTrip::VERSION
  gem.authors       = ['Taylor Mock']
  gem.email         = ['tmock12@gmail.com']
  gem.description   = %q{Wrapper for the Cleartrip flight API}
  gem.summary       = %q{Wrapper for the Cleartrip flight API}
  gem.homepage      = "http://github.com/tmock12/glasstrip"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 2.12'
end
