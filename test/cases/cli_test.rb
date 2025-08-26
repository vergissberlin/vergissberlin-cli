require_relative '../utils'
require 'open3'

class CliTest < Minitest::Test
  BIN_PATH = File.expand_path('../../bin/vergissberlin', __dir__)

  def test_cli_version_flag
    stdout, stderr, status = Open3.capture3(RbConfig.ruby, BIN_PATH, '--version')
    assert status.success?, "Process failed: #{stderr}"
    assert_match(/\A\d+\.\d+\.\d+\n\z/, stdout)
  end

  def test_cli_help_flag
    stdout, stderr, status = Open3.capture3(RbConfig.ruby, BIN_PATH, '--help')
    assert status.success?, "Process failed: #{stderr}"
    assert_includes stdout, 'Usage:'
  end

  def test_cli_default_banner
    stdout, stderr, status = Open3.capture3(RbConfig.ruby, BIN_PATH)
    assert status.success?, "Process failed: #{stderr}"
    assert_includes stdout, '_______'
  end
end