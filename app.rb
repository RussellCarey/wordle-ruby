
@lines = File.read("words.txt").split
@lines_length = (@lines.length - 1);
@rand = rand(@lines_length).floor;

@word = @lines[@rand].upcase

@guess;
@round_outcome = ["x", "x", "x", "x", "x", ]


def check_letter(index)
    # Does the letter exist in the word?
    # Can oop and overwrite letter to save lines
    @word.split(//).each_with_index { |l, i| 
        if (l == @guess[index]) 
          @round_outcome[index] = "m"
          break 
        else
           @round_outcome[index] = "x"
        end
    }
  
    # Is the letter correct place?
    if (@guess[index] == @word[index]) 
        @round_outcome[index] = "c"
    end;
end

def check_word() 
    #Check guess letters for match
    @guess.split(//).each_with_index {|cl, i|
        check_letter(i)
    }

    #Output the rounds results
    puts(@round_outcome.join('   '))
end

def win_condition
    @outcome_string = @round_outcome.join
    @count = @outcome_string.count("c")
    @has_won = @count === 5 ? true : false;
    return @has_won
end

# Recursive run game
def run_game()

  if (win_condition) 
    return puts("You have won!!!")
  end

  puts("TYPE A 5 LETTER WORD IN CAPS");

  # Get user input
  @guess = gets.chomp
  @guess = @guess.slice(0, 5)

  # CHEAT
  if(@guess == "XXXXX")
    puts("CHEATER! the word is..")
    puts(@word)
  end

  puts(" ")

  # Check the guess and the word for a match
  check_word()

  # Recursivly run the game again.
  run_game()
end

run_game()
