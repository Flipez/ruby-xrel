# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "xrel/version"

Gem::Specification.new do |spec|
  spec.name          = 'xrel'
  spec.version       = Xrel::VERSION
  spec.authors       = ['Flipez']
  spec.email         = ['code@brauser.io']

  spec.summary       = 'xrel api client'
  spec.description   = 'Fetch data from xrel via api'
  spec.homepage      = 'https://github.com/Flipez/ruby-xrel'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'oj'
  spec.add_dependency 'typhoeus'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
