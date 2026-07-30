# frozen_string_literal: true

module Vergissberlin
  # ASCII art of the Berlin skyline, with the Fernsehturm in the middle.
  module Skyline
    # Raw art. The tower axis (antenna, sphere, shaft) shares one column.
    RAW_LINES = [
      '                              |',
      '                              |',
      '                              |',
      '                             /|\\',
      '                           .-----.',
      '                          / ..... \\',
      '                         |  #####  |',
      '                          \\ ..... /',
      '                           \'-----\'',
      '                             | |',
      '                             | |',
      '                             | |',
      '               _             | |',
      '             .\' \'.           | |            _____',
      '      __    /_____\\          | |           |     |     __',
      '     |  |   |     |  ___    /   \\   ___    | [ ] |    |  |',
      '  ___|[]|___|  [] |_|   |__/     \\_|   |___|     |____|[]|___',
      ' |   |  |   |     | | []|  |     | | []|   | [ ] |    |  |   |',
      ' |[] |  |___|  [] |_| []|__|  [] |_| []|___|     |____|[]| [] |',
      '_|___|__|___|_____|_|___|__|_____|_|___|___|_____|____|__|____|_'
    ].freeze

    WIDTH = RAW_LINES.map(&:length).max

    # Padded to a single width so the diagonal rainbow stays even.
    LINES = RAW_LINES.map { |line| line.ljust(WIDTH).freeze }.freeze
  end
end
