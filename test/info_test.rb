# frozen_string_literal: true

require 'test_helper'

class InfoTest < Minitest::Test
  def test_render_includes_all_rows
    output = Vergissberlin::Info.render

    Vergissberlin::Info::ROWS.each do |label, value|
      assert_includes output, label
      assert_includes output, value
    end
  end

  def test_render_is_a_well_formed_table
    lines = Vergissberlin::Info.render.lines.map(&:chomp)

    assert lines.first.start_with?('┌')
    assert lines.last.start_with?('└')
    assert_equal Vergissberlin::Info::ROWS.size + 2, lines.size
  end

  def test_render_without_color_has_no_escape_codes
    refute_includes Vergissberlin::Info.render(colorize: false), "\e["
  end

  def test_render_with_color_highlights_links
    output = Vergissberlin::Info.render(colorize: true)

    assert_includes output, Vergissberlin::Info::CYAN
    assert_includes output, Vergissberlin::Info::BOLD
  end
end
