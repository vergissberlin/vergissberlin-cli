# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vergissberlin/version'

Gem::Specification.new do |spec|
  spec.name          = "vergissberlin"
  spec.version       = Vergissberlin::VERSION
  spec.authors       = ["André Lademann"]
  spec.email         = ["andre@programmerq.eu"]
  spec.summary       = %q{This is a useless tool without any features!}
  spec.description   = %q{This is a useless tool without any features! Trust me!}
  spec.homepage      = "https://github.com/vergissberlin/vergissberlin"
  spec.license       = "MIT"

  # Dateien und Ausführbares
  spec.files         = Dir.chdir(File.expand_path(__dir__)) { `git ls-files -z`.split("\x0") }
  spec.bindir        = "bin"
  spec.executables   = Dir.children("bin").grep_v(/\.\./)
  spec.require_paths = ["lib"]

  # Mindestanforderungen
  spec.required_ruby_version = ">= 2.7"

  # Entwicklungs-Abhängigkeiten (modernisiert, ungebundene Major-Mindestversionen mit pessimistischem Operator)
  spec.add_development_dependency "bundler", ">= 2.3", "< 3.0"
  spec.add_development_dependency "rake", ">= 13.0", "< 14.0"
  spec.add_development_dependency "minitest", ">= 5.18", "< 6.0"
  spec.add_development_dependency "coveralls", ">= 0.8", "< 1.0"
end
