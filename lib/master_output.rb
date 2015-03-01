require 'colorize'

class MasterOutput
  def welcome
    "WELCOME TO MASTERMIND".green
  end

  def initial_instructions
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?".blue
  end

  def instructions
    "The computer will generate a series of four letters representing randomly assigned colors.
    \nThe four colors it will generate are (r)ed, (g)reen, (b)lue, and (y)ellow.
    \nFor example, it will appear as 'yggb'.
    \nYou can guess the sequence by inputting a sequence of four letters.
    \nYou will receive feedback telling you how many colors are correct, and how many are in the right place.
    \nBased on the feedback you can guess again until you get the sequence correct.".cyan
  end

  def invalid_menu_choice
      "That is not a valid choice.".red 
  end

  def invalid_guess_length
     "That is an invalid number of characters. Please choose 4 colors.".red
  end

  def invalid_colors
    "That is an invalid choice of color. Please choose (r)ed,(g)reen, (b)lue, or (y)ellow.".red
  end

  def make_guess
    "Guess again!"
  end

  def feedback(input, correct_colors, check_correct_positions, guesses)
    puts "You guessed #{input}. You have #{correct_colors} of the correct elements with #{check_correct_positions} in the correct positions.\nYou've taken #{guesses} guess(es).".green
  end

  def game_instructions
    "I have generated a beginner sequence with four elements made up of: (r)ed,(g)reen, (b)lue, and (y)ellow.\nUse (q)uit at any time to end the game.
    \nWhat's your guess?".blue
  end

  def congrats(input, guesses, final_time, final_time2)
    "Congratulations you win! You guessed the sequence #{input} with #{guesses} guess(es) in #{final_time.to_i/60} minutes, #{final_time2 % 60} seconds.".yellow
  end

end
