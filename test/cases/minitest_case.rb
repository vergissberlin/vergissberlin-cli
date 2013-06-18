require "#{File.dirname(__FILE__)}/../../lib/vergissberlin"

class TestMeme < MiniTest::Unit::TestCase
  def setup
    @meme = Vergissberlin::Meme.new
  end

  def test_its_cool
    assert_equal "YEAR!", @meme.that_should_be_cool
  end

end