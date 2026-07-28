# frozen_string_literal: true

require 'test_helper'
require 'stringio'

class CliTest < Minitest::Test
  def test_version_flag
    out = StringIO.new
    status = Vergissberlin::CLI.run(['--version'], out: out)

    assert_equal 0, status
    assert_equal "#{Vergissberlin::VERSION}\n", out.string
  end

  def test_short_version_flag
    out = StringIO.new
    status = Vergissberlin::CLI.run(['-v'], out: out)

    assert_equal 0, status
    assert_equal "#{Vergissberlin::VERSION}\n", out.string
  end

  def test_help_flag
    out = StringIO.new
    status = Vergissberlin::CLI.run(['--help'], out: out)

    assert_equal 0, status
    assert_includes out.string, 'Usage:'
  end

  def test_default_banner
    out = StringIO.new
    status = Vergissberlin::CLI.run([], out: out)

    assert_equal 0, status
    assert_includes out.string, '_______'
    assert_includes out.string, '|_____/'
    refute_includes out.string, "\e["
  end

  def test_banner_lines_are_aligned
    widths = Vergissberlin::CLI::BANNER_LINES.map(&:length)

    assert_equal 1, widths.uniq.size, 'banner lines must share one width'
    assert(widths.first >= 60)
  end

  def test_rainbow_banner_when_forced
    out = StringIO.new
    with_env('FORCE_COLOR' => '1', 'NO_COLOR' => nil) do
      status = Vergissberlin::CLI.run([], out: out)

      assert_equal 0, status
      assert_includes out.string, "\e[38;2;"
      assert_includes out.string, "\e[0m"
      plain = out.string.gsub(/\e\[[0-9;]*m/, '')
      assert_includes plain, '_______'
    end
  end

  def test_no_color_disables_rainbow
    out = StringIO.new
    with_env('FORCE_COLOR' => nil, 'NO_COLOR' => '1') do
      status = Vergissberlin::CLI.run([], out: out)

      assert_equal 0, status
      refute_includes out.string, "\e["
    end
  end

  def test_force_color_zero_disables_rainbow
    out = StringIO.new
    with_env('FORCE_COLOR' => '0', 'NO_COLOR' => nil) do
      status = Vergissberlin::CLI.run([], out: out)

      assert_equal 0, status
      refute_includes out.string, "\e["
    end
  end

  def test_clicolor_force_enables_rainbow
    out = StringIO.new
    with_env(
      'FORCE_COLOR' => nil,
      'NO_COLOR' => nil,
      'CLICOLOR_FORCE' => '1'
    ) do
      status = Vergissberlin::CLI.run([], out: out)

      assert_equal 0, status
      assert_includes out.string, "\e[38;2;"
    end
  end

  def test_non_tty_skips_rainbow_without_env
    out = StringIO.new
    without_color_env do
      status = Vergissberlin::CLI.run([], out: out)

      assert_equal 0, status
      refute_includes out.string, "\e["
    end
  end

  def test_tty_enables_rainbow_without_env
    out = tty_buffer
    without_color_env do
      status = Vergissberlin::CLI.run([], out: out)

      assert_equal 0, status
      assert_includes out.string, "\e[38;2;"
    end
  end

  def test_invalid_option
    out = StringIO.new
    err = StringIO.new
    status = Vergissberlin::CLI.run(['--nope'], out: out, err: err)

    assert_equal 1, status
    assert_includes err.string, 'invalid option'
    assert_includes err.string, 'Usage:'
  end

  private

  def without_color_env(&block)
    with_env(
      'FORCE_COLOR' => nil,
      'NO_COLOR' => nil,
      'CLICOLOR_FORCE' => nil,
      &block
    )
  end

  def tty_buffer
    out = StringIO.new
    def out.tty?
      true
    end
    out
  end

  def with_env(vars)
    previous = vars.keys.to_h { |key| [key, ENV[key]] }
    apply_env(vars)
    yield
  ensure
    apply_env(previous)
  end

  def apply_env(vars)
    vars.each do |key, value|
      value.nil? ? ENV.delete(key) : ENV[key] = value
    end
  end
end
