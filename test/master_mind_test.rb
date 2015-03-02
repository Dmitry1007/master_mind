require 'minitest/autorun'
require 'minitest/pride'
require '../lib/master_mind'

class MastermindTest < Minitest::Test
attr_reader :mastermind
  
  def setup
    @mastermind = Mastermind.new
  end

  def test_it_exists
    assert mastermind
  end

  def test_the_right_code_wins
    mastermind.secret_code = "yggr"
    assert_equal true, mastermind.winner?("yggr")
  end

  def test_the_wrong_code_loses
    mastermind.secret_code = "yggr"
    assert_equal false, mastermind.winner?("gggg")
  end

  def test_it_loses_after_15_guesses
    mastermind.start  
    mastermind.guesses = 16
    assert_equal true, mastermind.loser?
  end

  def test_guess_length_is_valid
    assert mastermind.guess_length_is_valid?("ygrb") 
  end

  def test_guess_length_is_invalid
    refute mastermind.guess_length_is_valid?("ygrby") 
  end

  def test_guess_colors_are_valid
    assert mastermind.guess_colors_are_valid?("rbgy")
    assert mastermind.guess_colors_are_valid?("rggg")
    assert mastermind.guess_colors_are_valid?("bbbb")
  end

  def test_guess_colors_are_invalid
    assert_equal false, mastermind.guess_colors_are_valid?("rxzy")
    assert_equal false, mastermind.guess_colors_are_valid?("tuvx")
    assert_equal false, mastermind.guess_colors_are_valid?("rbcy")   
  end

  def test_a_valid_input_evaluates_to_valid
    assert_equal true, mastermind.everything_valid?("rrrr")
    assert_equal true, mastermind.everything_valid?("rrby")
  end

  def test_an_invalid_input_evaluates_to_invalid
    assert_equal false, mastermind.everything_valid?("@4y7*^")
    assert_equal false, mastermind.everything_valid?("rr")
    assert_equal false, mastermind.everything_valid?("hjyl***0")
    assert_equal false, mastermind.everything_valid?("")
  end

  def test_it_knows_how_many_positions_are_right
    assert_equal 0, mastermind.check_correct_positions("bgry","gryb")
    assert_equal 1, mastermind.check_correct_positions("yyry","bbrb")
    assert_equal 2, mastermind.check_correct_positions("rgyb","ygyr")
    assert_equal 3, mastermind.check_correct_positions("rgbb","rgyb")
    assert_equal 4, mastermind.check_correct_positions("bbbb","bbbb")
  end

  def test_it_knows_how_many_colors_are_right
    assert_equal 0, mastermind.check_correct_colors("rrrr","yyyy")
    assert_equal 1, mastermind.check_correct_colors("rbbb","ryyy")
    assert_equal 2, mastermind.check_correct_colors("byyy","bygg")
    assert_equal 3, mastermind.check_correct_colors("rbby","ryyb") 
    assert_equal 4, mastermind.check_correct_colors("rybg","rybg")
  end

end
