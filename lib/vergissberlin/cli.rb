# frozen_string_literal: true

require 'optparse'
require 'vergissberlin/version'

module Vergissberlin
  # Command-line interface for the vergissberlin gem.
  class CLI
    # Properly aligned figlet "big" banner for "THATS COOL".
    BANNER_LINES = [
      ' _______ _    _       _______ _____    _____ ____   ____  _      ',
      '|__   __| |  | |   /\\|__   __/ ____|  / ____/ __ \\ / __ \\| |     ',
      '   | |  | |__| |  /  \\  | | | (___   | |   | |  | | |  | | |     ',
      '   | |  |  __  | / /\\ \\ | |  \\___ \\  | |   | |  | | |  | | |     ',
      '   | |  | |  | |/ ____ \\| |  ____) | | |___| |__| | |__| | |____ ',
      '   |_|  |_|  |_/_/    \\_\\_| |_____/   \\_____\\____/ \\____/|______|'
    ].freeze

    BANNER = (['', ''] + BANNER_LINES + ['', '']).join("\n").freeze

    RESET = "\e[0m"

    def self.run(argv = ARGV, out: $stdout, err: $stderr)
      new(argv, out: out, err: err).run
    end

    def initialize(argv, out: $stdout, err: $stderr)
      @argv = argv.dup
      @out = out
      @err = err
    end

    def run
      options = parse_options
      dispatch(options)
    rescue OptionParser::InvalidOption => e
      print_invalid_option(e)
      1
    end

    private

    def dispatch(options)
      return show_help if options[:help]
      return show_version if options[:version]

      @out.print render_banner
      0
    end

    def show_help
      @out.puts @parser
      0
    end

    def show_version
      @out.puts Vergissberlin::VERSION
      0
    end

    def print_invalid_option(error)
      @err.puts error.message
      @err.puts @parser
    end

    def parse_options
      options = {}
      @parser = build_parser(options)
      @parser.parse!(@argv)
      options
    end

    def build_parser(options)
      OptionParser.new do |opts|
        opts.banner = 'Usage: vergissberlin [options]'
        opts.on('-v', '--version', 'Show installed version') do
          options[:version] = true
        end
        opts.on('-h', '--help', 'Show help') { options[:help] = true }
      end
    end

    def render_banner
      return BANNER unless colorize?

      colored = BANNER_LINES.map.with_index do |line, row|
        rainbow_line(line, row)
      end
      "\n\n#{colored.join("\n")}\n\n"
    end

    def colorize?
      forced = force_color_setting
      return forced unless forced.nil?
      return false if ENV['NO_COLOR']
      return true if env_flag_on?('CLICOLOR_FORCE')

      tty_out?
    end

    # nil = unset, true/false = explicit force on/off
    def force_color_setting
      force = ENV['FORCE_COLOR']
      return nil if force.nil? || force.empty?

      force != '0'
    end

    def env_flag_on?(name)
      value = ENV[name]
      !(value.nil? || value.empty? || value == '0')
    end

    def tty_out?
      @out.respond_to?(:tty?) && @out.tty?
    end

    # Lolcat-style diagonal rainbow via ANSI truecolor.
    def rainbow_line(line, row)
      line.chars.map.with_index do |char, col|
        r, g, b = rainbow_rgb(row + col)
        "\e[38;2;#{r};#{g};#{b}m#{char}"
      end.join + RESET
    end

    def rainbow_rgb(index)
      [
        wave(index, 0),
        wave(index, 2 * Math::PI / 3),
        wave(index, 4 * Math::PI / 3)
      ]
    end

    def wave(index, phase)
      (Math.sin(0.15 * index + phase) * 127 + 128).round
    end
  end
end
