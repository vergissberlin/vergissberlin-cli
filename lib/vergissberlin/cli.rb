# frozen_string_literal: true

require 'optparse'
require 'vergissberlin/version'

module Vergissberlin
  # Command-line interface for the vergissberlin gem.
  class CLI
    BANNER = <<~BANNER


        _______ _    _       _______ _____    _____ ____   ____  _
       |__   __| |  | |   /\\|__   __/ ____|  / ____/ __ \\ / __ \\| |
          | |  | |__| |  /  \\  | | | (___   | |   | |  | | |  | | |
          | |  |  __  | / /\\ \\ | |  \\___ \\  | |   | |  | | |  | | |
          | |  | |  | |/ ____ \\| |  ____) | | |___| |__| | |__| | |____
          |_|  |_|  |_/_/    \\_\\_| |_____/   \\_____\\____/ \\____/|______|


    BANNER

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
      return 0 if options.nil?

      if options[:help]
        @out.puts @parser
        return 0
      end

      if options[:version]
        @out.puts Vergissberlin::VERSION
        return 0
      end

      @out.print BANNER
      0
    rescue OptionParser::InvalidOption => e
      @err.puts e.message
      @err.puts @parser
      1
    end

    private

    def parse_options
      options = {}
      @parser = OptionParser.new do |opts|
        opts.banner = 'Usage: vergissberlin [options]'

        opts.on('-v', '--version', 'Show version') do
          options[:version] = true
        end

        opts.on('-h', '--help', 'Show help') do
          options[:help] = true
        end
      end

      @parser.parse!(@argv)
      options
    end
  end
end
