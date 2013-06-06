
$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'version'

class Version_test < Test::Unit::TestCase
	def test_foo
		flunk "TODO: Write test"
		assert_equal("foo", bar)
	end
end
