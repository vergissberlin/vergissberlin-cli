require 'bundler'

Bundler::GemHelper.install_tasks
require 'rake/testtask'


#group :test do
#  gem "minitest"
#  gem "minitest-reporters", '>= 0.5.0'
#  gem "redgreen"
#end


Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

task :default => :test
