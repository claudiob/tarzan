# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tarzan/version'

Gem::Specification.new do |spec|
  spec.name          = 'tarzan'
  spec.version       = Tarzan::VERSION
  spec.authors       = ['claudiob']
  spec.email         = ['claudiob@gmail.com']
  spec.summary       = %q{King of the Game Jungle.}
  spec.description   = %q{Step-by-step tutorial to modular games in Ruby}
  spec.homepage      = 'https://github.com/claudiob/tarzan'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'nico', '>= 0.1.0' # Campfire integration
  spec.add_dependency 'gosu' # 2D graphic engine for OS X

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 0'
  spec.add_development_dependency 'rspec'
end
