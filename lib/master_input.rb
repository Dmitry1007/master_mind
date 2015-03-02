require '../lib/master_mind'
require '../lib/master_output'
require 'colorize'

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
        puts "GOODBYE!".green 
      else
        puts msg.invalid_menu_choice
      end
    end
  end

  def play
	  mastermind.start
	 	puts msg.game_instructions(mastermind.max_guesses)
	 	input = ""

	 	while input != 'q'
	 		input = gets.chomp.downcase
	 		
	 		if won_on_first_try?(input)
	 			mastermind.guesses += 1
	 			puts msg.congrats(input, mastermind.guesses, mastermind.elapsed_time, mastermind.elapsed_time)
	 			break
	 		elsif mastermind.winner?(input)
	 			mastermind.guesses += 1
	 			puts msg.congrats(input, mastermind.guesses, mastermind.elapsed_time, mastermind.elapsed_time)
	 			break
	 		elsif input == 'c'
	 			puts "SECRET CODE = #{mastermind.secret_code.upcase}"
	 		elsif input == 'q'
	 			break
	 		elsif mastermind.guess_length_is_valid?(input) == false
	 			puts msg.invalid_guess_length
	 		elsif mastermind.guess_colors_are_valid?(input) == false
	 			puts msg.invalid_colors
	 		elsif mastermind.loser?
	 			puts msg.loser
	 			break
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
