require_relative '../utils'

class VersionTest < Minitest::Test
  def test_version_constant_format
    assert_match(/\A\d+\.\d+\.\d+\z/, Vergissberlin::VERSION)
  end

  def test_version_is_frozen_string
    assert Vergissberlin::VERSION.frozen?
  end
end