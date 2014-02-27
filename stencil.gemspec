# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stencil/version'

Gem::Specification.new do |spec|
  spec.name          = "stencil"
  spec.version       = Stencil::VERSION
  spec.authors       = ["cohitre"]
  spec.email         = ["carlosrr@gmail.com"]
  spec.description   = %q{Very reusable and maintanable template widgets}
  spec.summary       = %q{Stencil is a small framework to generate very reusable and testable views. Each stencil class has its own methods and template file. It's inspired by Erector to allow for inheritance and encapsulation without losing the convenience of template files.}
  spec.homepage      = "https://github.com/cohitre/stencil"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.0.0"
  spec.add_development_dependency "guard-rspec"

  spec.add_dependency "tilt"
end
