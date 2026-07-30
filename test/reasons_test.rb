# frozen_string_literal: true

require 'test_helper'

class ReasonsTest < Minitest::Test
  ALL = Vergissberlin::Reasons::ALL

  def test_sample_returns_a_known_reason
    assert_includes ALL, Vergissberlin::Reasons.sample
  end

  def test_sample_is_reproducible_for_a_seed
    first = Vergissberlin::Reasons.sample(random: Random.new(1979))
    second = Vergissberlin::Reasons.sample(random: Random.new(1979))

    assert_equal first, second
  end

  def test_reasons_are_unique
    assert_equal ALL.size, ALL.uniq.size
  end

  def test_reasons_are_single_short_lines
    ALL.each do |reason|
      refute_empty reason.strip
      refute_includes reason, "\n"
      assert_operator reason.length, :<=, 70
    end
  end

  def test_there_is_more_than_one_reason_to_leave
    assert_operator ALL.size, :>, 5
  end
end
