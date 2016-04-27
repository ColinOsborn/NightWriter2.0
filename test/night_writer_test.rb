require "./test/test_helper"
require "./lib/night_writer"


class NightWriterTest < Minitest::Test

  def test_we_can_return_a_single_letter
    nw = NightWriter.new
    output = nw.encode_to_braille("a")
    assert_equal "0.\n..\n..", output
  end

  def test_we_can_return_two_letters
    nw = NightWriter.new
    output = nw.encode_to_braille("ab")
    assert_equal "0.0.\n..0.\n....", output
  end

  def test_we_can_return_a_full_word
    nw = NightWriter.new
    output = nw.encode_to_braille("hello")
    assert_equal "0.0.0.0.0.\n00.00.0..0\n....0.0.0.", output
  end

  def test_we_can_return_a_full_word_not_hello
    nw = NightWriter.new
    output = nw.encode_to_braille("world")
    assert_equal ".00.0.0.00\n00.0000..0\n.00.0.0...", output
  end

  def test_we_can_return_a_full_word_with_spaces
    nw = NightWriter.new
    output = nw.encode_to_braille("hello world")
    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...", output
  end

end
