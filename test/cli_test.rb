# frozen_string_literal: true

require "test_helper"
require "stringio"

class CliTest < Minitest::Test
  def test_version_flag
    out = StringIO.new
    status = Vergissberlin::CLI.run(["--version"], out: out)

    assert_equal 0, status
    assert_match(/\A\d+\.\d+\.\d+\n\z/, out.string)
  end

  def test_help_flag
    out = StringIO.new
    status = Vergissberlin::CLI.run(["--help"], out: out)

    assert_equal 0, status
    assert_includes out.string, "Usage:"
  end

  def test_default_banner
    out = StringIO.new
    status = Vergissberlin::CLI.run([], out: out)

    assert_equal 0, status
    assert_includes out.string, "_______"
  end

  def test_invalid_option
    out = StringIO.new
    err = StringIO.new
    status = Vergissberlin::CLI.run(["--nope"], out: out, err: err)

    assert_equal 1, status
    assert_includes err.string, "invalid option"
    assert_includes err.string, "Usage:"
  end
end
