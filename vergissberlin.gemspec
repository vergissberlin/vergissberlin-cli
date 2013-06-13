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
#	spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
#  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
	spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths = ["lib"]


	spec.files					= Dir.glob("{bin,lib,examples,test}/**/*") + %w(README.md)
  spec.has_rdoc				= true

  spec.bindir					= "bin"
  spec.executables << "vergissberlin"

	spec.add_dependency "capistrano" , "~>  2.15.2"
  spec.add_dependency "capistrano-ext","~> 1.2.1"
  spec.add_dependency "capistrano_colors", "~> 0.5.5"
  spec.add_dependency "railsless-deploy", "~> 1.1.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "mocha", "~> 0.14.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters", "~> 0.0.5"
  spec.add_development_dependency "redgreen", "~> 1.2.2"
  spec.add_development_dependency "rake"
end
