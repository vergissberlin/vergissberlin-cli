require_relative '../utils'

class TestMeme < Minitest::Test
  def setup
    @meme = Vergissberlin::Meme.new
  end

  def test_its_cool
    assert_equal "YEAR!", @meme.that_should_be_cool
  end

end