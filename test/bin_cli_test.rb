# frozen_string_literal: true

require 'test_helper'
require 'open3'

class BinCliTest < Minitest::Test
  BIN_PATH = File.expand_path('../bin/vergissberlin', __dir__)

  def test_cli_version_flag
    stdout, stderr, status = Open3.capture3(
      RbConfig.ruby, BIN_PATH, '--version'
    )
    assert status.success?, "Process failed: #{stderr}"
    assert_equal "#{Vergissberlin::VERSION}\n", stdout
  end

  def test_cli_short_version_flag
    stdout, stderr, status = Open3.capture3(
      RbConfig.ruby, BIN_PATH, '-v'
    )
    assert status.success?, "Process failed: #{stderr}"
    assert_equal "#{Vergissberlin::VERSION}\n", stdout
  end

  def test_cli_help_flag
    stdout, stderr, status = Open3.capture3(
      RbConfig.ruby, BIN_PATH, '--help'
    )
    assert status.success?, "Process failed: #{stderr}"
    assert_includes stdout, 'Usage:'
  end

  def test_cli_default_skyline_and_reason
    stdout, stderr, status = Open3.capture3(
      { 'NO_COLOR' => '1', 'FORCE_COLOR' => '0' },
      RbConfig.ruby, BIN_PATH
    )
    assert status.success?, "Process failed: #{stderr}"
    assert_includes stdout, Vergissberlin::Skyline::LINES.last
    assert_includes stdout, Vergissberlin::Reasons::HEADLINE
    refute_includes stdout, "\e["
  end

  def test_cli_info_command
    stdout, stderr, status = Open3.capture3(
      RbConfig.ruby, BIN_PATH, 'info'
    )
    stdout.force_encoding(Encoding::UTF_8)
    assert status.success?, "Process failed: #{stderr}"
    assert_includes stdout, 'André Lademann'
    assert_includes stdout, 'github.com/vergissberlin'
    assert_includes stdout, 'blog.andrelademann.de'
  end
end
