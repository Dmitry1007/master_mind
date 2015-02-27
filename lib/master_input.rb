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
 		puts "SECRET CODE =#{mastermind.secret_code}"
 		input = gets.chomp.downcase

 		if mastermind.winner?(input)
 			puts msg.congrats(input, 2, 4, 4)
 		elsif mastermind.guess_length_is_valid?(input) == false
 			puts msg.invalid_guess_length
 		elsif mastermind.guess_colors_are_valid?(input) == false
 			puts msg.invalid_colors 
 				
 		else
 			puts "KEEP TRYING"

 		end

 	end 
 	
  end
end

new_game = Game.new
new_game.menu
