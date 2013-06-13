unless defined?(TestExtensions)
  $:.unshift "#{File.dirname(__FILE__)}/../lib"

  begin
    require 'rubygems'
    gem     'mocha/setup'
  rescue LoadError
  end

	require 'minitest/autorun'
  require 'mocha/setup'


end