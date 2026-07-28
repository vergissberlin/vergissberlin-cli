# frozen_string_literal: true

require 'optparse'
require 'vergissberlin/version'

module Vergissberlin
  # Command-line interface for the vergissberlin gem.
  class CLI
    BANNER = [
      '',
      '',
      '  _______ _    _       _______ _____    _____ ____   ____  _',
      ' |__   __| |  | |   /\\|__   __/ ____|  / ____/ __ \\ / __ \\| |',
      '    | |  | |__| |  /  \\  | | | (___   | |   | |  | | |  | | |',
      '    | |  |  __  | / /\\ \\ | |  \\___ \\  | |   | |  | | |  | | |',
      '    | |  | |  | |/ ____ \\| |  ____) | | |___| |__| | |__| | |____',
      '    |_|  |_|  |_/_/    \\_\\_| |_____/   \\_____\\____/ \\____/|______|',
      '',
      ''
    ].join("\n").freeze

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

      @out.print BANNER
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
        opts.on('-v', '--version', 'Show version') { options[:version] = true }
        opts.on('-h', '--help', 'Show help') { options[:help] = true }
      end
    end
  end
end
