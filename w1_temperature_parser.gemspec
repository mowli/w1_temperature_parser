# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'w1_temperature_parser/version'

Gem::Specification.new do |spec|
  spec.name          = 'w1_temperature_parser'
  spec.version       = W1TemperatureParser::VERSION
  spec.authors       = ['Oliver Noack']
  spec.email         = ["oliver.noack@zweitag.de"]

  spec.summary       = 'Parse DS18B20 data'
  spec.description   = 'Some utils to ease handling of DS18B20 temperature data'
  spec.homepage      = 'https://github.com/mowli/w1_temperature_parser'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ['parse_temperature']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
end
