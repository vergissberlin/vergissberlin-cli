#!/usr/bin/env rake
require "bundler/gem_tasks"
Bundler.setup(:default, :development)

require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

task :default => :test



