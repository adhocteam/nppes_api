# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nppes_api/version'

Gem::Specification.new do |spec|
  spec.name          = "nppes_api"
  spec.version       = NPPESApi::VERSION
  spec.authors       = ["Aubrey Holland"]
  spec.email         = ["aubrey@adhocteam.us"]

  spec.summary       = 'Tools for searching the NPPES directory by their API'
  spec.description   = 'CMS provides an API for searching providers and organizations in NPPES. This is a tool for accessing it.'
  spec.homepage      = "https://github.com/adhocteam/nppes_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'multi_json', '> 0'
  spec.add_runtime_dependency 'rest-client', '> 0'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
