# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'afterbuy/version'

Gem::Specification.new do |spec|
  spec.name          = "afterbuy"
  spec.version       = Afterbuy::VERSION
  spec.authors       = ["Salim Hbeiliny"]
  spec.email         = ["salim@railslove.com"]
  spec.summary       = %q{A wrapper for the Afterbuy API}
  spec.description   = %q{This is a wrapper for the Afterbuy API documented here: http://xmldoku.afterbuy.de/dokued/}
  spec.homepage      = 'https://github.com/railslove/afterbuy'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', '~> 4.2'
  spec.add_dependency 'faraday'
  spec.add_dependency 'roar'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'pry'
end
