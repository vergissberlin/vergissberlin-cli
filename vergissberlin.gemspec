# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vergissberlin/version"

Gem::Specification.new do |spec|
  spec.name = "vergissberlin"
  spec.version = Vergissberlin::VERSION
  spec.authors = ["André Lademann"]
  spec.email = ["andre@programmerq.eu"]

  spec.summary = "This is a useless tool without any features!"
  spec.description = "This is a useless tool without any features! Trust me!"
  spec.homepage = "https://github.com/vergissberlin/vergissberlin-cli"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.start_with?("test/", ".git", ".github")
    end
  end
  spec.bindir = "bin"
  spec.executables = ["vergissberlin"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 2.4", "< 3.0"
  spec.add_development_dependency "minitest", "~> 5.25"
  spec.add_development_dependency "rake", "~> 13.2"
  spec.add_development_dependency "simplecov", "~> 0.22"
  spec.add_development_dependency "simplecov-lcov", ">= 0.8", "< 1.0"
end
