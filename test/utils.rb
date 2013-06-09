unless defined?(TestExtensions)
  $:.unshift "#{File.dirname(__FILE__)}/../lib"

  begin
    require 'rubygems'
    gem     'mocha/setup'
  rescue LoadError
  end

  require 'test/unit'
  require 'mocha/setup'

end