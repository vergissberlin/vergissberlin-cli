# frozen_string_literal: true

require 'test_helper'

class SkylineTest < Minitest::Test
  LINES = Vergissberlin::Skyline::LINES

  def test_lines_share_one_width
    widths = LINES.map(&:length)

    assert_equal 1, widths.uniq.size, 'skyline lines must share one width'
    assert_equal Vergissberlin::Skyline::WIDTH, widths.first
    assert_operator widths.first, :>=, 60
  end

  def test_lines_are_pure_ascii
    LINES.each do |line|
      assert(line.ascii_only?, "not ascii: #{line}")
    end
  end

  def test_fernsehturm_sphere_is_centered_below_the_antenna
    antenna = LINES.first.index('|')
    sphere = LINES.find { |line| line.include?('#####') }

    refute_nil sphere, 'skyline must show the Fernsehturm sphere'
    assert_equal antenna, sphere.index('#####') + 2
  end

  def test_tower_shaft_sits_on_the_ground_line
    assert_equal LINES.last.length, LINES.last.count('_|')
  end
end
