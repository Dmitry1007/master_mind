require '../lib/master_mind'
require '../lib/master_output'

class Game
  attr_reader :msg, :mastermind

  def initialize
    @mastermind = Mastermind.new
    @msg = MasterOutput.new
  end

  def menu
    puts msg.welcome
    input = "" 

    while input != 'q'
      puts msg.initial_instructions
      input = gets.chomp.downcase

      case input
      when 'i'
        puts msg.instructions
      when 'p'
        play
      when 'q'
        puts "GOODBYE!" 
      else
        puts msg.invalid_menu_choice
      end
    end
  end

  def play
  	# require 'pry';binding.pry
  	mastermind.start
 	puts msg.game_instructions
 	input = "" 

 	while input != 'q'
 		puts "SECRET CODE = #{mastermind.secret_code.upcase}"
 		input = gets.chomp.downcase

 		if won_on_first_try?(input)
 			mastermind.guesses += 1
 			puts msg.congrats(input, mastermind.guesses, 4, 4)
 			break
 		elsif mastermind.winner?(input)
 			puts msg.congrats(input, mastermind.guesses, 4, 4)
 			break
 		elsif mastermind.guess_length_is_valid?(input) == false
 			puts msg.invalid_guess_length
 		elsif mastermind.guess_colors_are_valid?(input) == false
 			puts msg.invalid_colors 
 		else mastermind.everything_valid?(input)
 			mastermind.guesses += 1 
 			puts msg.feedback(input, mastermind.check_correct_colors(input), mastermind.check_correct_positions(input), mastermind.guesses)  			
 		end
 	end 
 	
  end
end

private

def won_on_first_try?(input)
	mastermind.winner?(input) && mastermind.guesses == 0 
end

new_game = Game.new
new_game.menu
