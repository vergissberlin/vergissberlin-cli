# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vergissberlin/version'

Gem::Specification.new do |spec|
  spec.name          = "vergissberlin"
  spec.version       = Vergissberlin::VERSION
  spec.authors       = ["André Lademann"]
  spec.email         = ["andre@programmerq.eu"]
  spec.description   = %q{This is a useless tool without any features! Trust me!}
  spec.summary       = %q{This is a useless tool without any features!}
  spec.homepage      = "https://github.com/vergissberlin/vergissberlin"
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
	spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths = ["lib"]
	spec.files					= Dir.glob("{bin,lib,examples,test}/**/*") + %w(README.md)
  spec.has_rdoc				= true
  spec.bindir					= "bin"
  spec.executables << "vergissberlin"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "minitest", "~> 5.0.4"
  spec.add_development_dependency "rake", "~> 10.0.4"
  spec.add_development_dependency "coveralls", "~> 0.6.7"
end
