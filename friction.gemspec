# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'friction/version'

Gem::Specification.new do |spec|
  spec.name          = 'friction'
  spec.version       = Friction::VERSION.dup
  spec.authors       = ['Rafal Chmiel']
  spec.email         = ['rafalmarekchmiel@gmail.com']
  spec.summary       = %q{A tool to check your project for common sources of contributor friction.}
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/rafalchmiel/friction'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'fakefs'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'coveralls'

  spec.add_runtime_dependency 'slop', '~> 3.5'
  spec.add_runtime_dependency 'colored', '~> 1.2'
end
