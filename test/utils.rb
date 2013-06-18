require 'coveralls'
require 'minitest/autorun'
require 'minitest/pride'

require File.expand_path('../../lib/vergissberlin.rb', __FILE__)

Coveralls.wear!


unless defined?(TestExtensions)
  $:.unshift "#{File.dirname(__FILE__)}/../lib"
  begin
    require 'rubygems'
    rescue LoadError
    end
  require 'minitest/spec'
  require 'minitest/autorun'
end