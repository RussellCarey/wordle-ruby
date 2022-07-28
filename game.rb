require_relative "./word.rb"


class Game 
    attr_reader :word, :row_status

    def initialize(word_controller)
      @word_controller = word_controller
      @row_status = []
      @is_first_round = true;
    end

    def start_round
        # On new recursion, check if we have won
       
        if win_condition?(@row_status)
            puts("You have won!!!") 
        end
        
        if @is_first_round 
            puts(" ")
            puts("Guess the chosen word! Type in a 5 letter word")
            puts("Key: c = its in the correct place, x = its not in the word and m = its in the word but a different place.")
            puts("  ")
        end

        if !@is_first_round
            puts(" ")
            puts("Please try again! Enter another word")
        end

        @user_guess = get_user_guess()
        @row_status = @word_controller.check_word_for_letter(@user_guess)

        puts(" ")
        puts("Let's check how right you are?")
        puts(@row_status.join("  "))
        puts(" ")

        @is_first_round = false
        start_round()
    end

    private def get_user_guess
        # Get user input
        @guess = gets.chomp
        @guess = @guess.slice(0, 5)

        # CHEAT
        puts("CHEATER! the word is.. #{@word}") if (@guess == "CHEAT")

        return @guess
    end

    def win_condition?(row_status)
        @outcome_string = row_status.join
        @count = @outcome_string.count("c")
        @has_won = @count == 5 ? true : false
    end

    def reset_game
    end
    
# temp 
@word_con = Word.new('./Files/words.txt')
@game = Game.new(@word_con)
@game.start_round()