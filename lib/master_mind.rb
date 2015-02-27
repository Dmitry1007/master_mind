
class Mastermind

  attr_reader :msg, :available_colors, :count
  attr_accessor :secret_code, :start_time, :guesses

  def initialize
    @available_colors = ['r','g','b','y'] * 4
  end

  def start
    start_time = Time.new
    @guesses = 0 
    @secret_code = @available_colors.sample(4).join
  end

  def winner?(input)
    secret_code == input
  end

  def loser?(input)
    @guesses > 15 
  end

  def guess_length_is_valid?(input)
    input.size == 4
  end

  def guess_colors_are_valid?(input) 
    # require 'pry';binding.pry
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

    # @count = 0
    # input.each_with_index do |color, index| 
    #   if color == secret_pins[index] 
    #   @count += 1
    #   end 
    # end
    # @count 

    # @count = 0
    # @count += 1 if input[0] == secret_pins[0]
    # @count += 1 if input[1] == secret_pins[1] 
    # @count += 1 if input[2] == secret_pins[2] 
    # @count += 1 if input[3] == secret_pins[3]
    # @count
  end

  def check_correct_colors(input, secret_pins=@secret_code)
    
    user_guess = input.chars.uniq
    comp_secret = secret_pins.chars.uniq 

    zip_it = user_guess.zip(comp_secret)

    zip_it.inject(0) do |count, array|
      if ! array.include?(nil)
        count += 1
      end
      count
    end

    # Not Working
    # difference = input.select { |color| secret_pins.include?(color) }
    # difference.uniq.size

    # correct_colors = 0
    # @secret_pins.chars.uniq.each do |color|
    #   if input.chars.uniq.include?(color)
    #     correct_colors += 1
    #   end
    # end
    # return correct_colors

  end

  def guess(input)

  end

  def game_time
    ((Time.now - Time.at(start_time)).to_i).divmod(60)
  end
end








if __FILE__ == $0
master = Mastermind.new
# master.guesses=16
# puts master.guesses 

puts master.start
end
