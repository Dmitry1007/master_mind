
class Mastermind

  attr_reader :msg, :available_colors, :count
  attr_accessor :secret_code, :start_time, :guesses

  def initialize
    @available_colors = ['r','g','b','y'] * 4
  end

  def start
    @start_time = Time.new
    @guesses = 0
    @secret_code = @available_colors.sample(4).join
  end

  def winner?(input)
    secret_code == input
  end

  def loser?
    @guesses >= 2
  end

  def guess_length_is_valid?(input)
    input.size == 4
  end

  def guess_colors_are_valid?(input) 
    input.chars.all? { |l| available_colors.include?(l) }
  end

  def everything_valid?(input)
    guess_length_is_valid?(input) && guess_colors_are_valid?(input)
  end

  def check_correct_positions(input, secret_pins=@secret_code)
    input = input.chars
    secret_pins = secret_pins.chars

    results = input.zip(secret_pins).map { |x,y| x == y }
    total = results.count { |value| value == true }
  end
 
  def check_correct_colors(input, secret_pins=@secret_code)
    user_guess = input.chars.uniq
    comp_secret = secret_pins.chars.uniq 

    total = user_guess.map { |x| comp_secret.include?(x) }
    total.count(true) 
  end

  def elapsed_time
    (Time.now - @start_time).to_i 
  end

end

