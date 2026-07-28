# frozen_string_literal: true

require 'test_helper'

class MemeTest < Minitest::Test
  def setup
    @meme = Vergissberlin::Meme.new
  end

  def test_that_should_be_cool
    assert_equal 'YEAR!', @meme.that_should_be_cool
  end
end
