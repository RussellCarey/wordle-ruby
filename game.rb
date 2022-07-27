require_relative "./word.rb"


class Game 
    attr_reader :word

    def initialize(word_controller)
      @word_controller = word_controller
      @row_status = []
    end

    def start_round

        # On new recursion, check if we have won
        puts("You have won!!!") if win_condition()?
        
        puts("TYPE A 5 LETTER WORD IN CAPS")
        puts("")

        @user_guess = get_user_guess()
        @row_status = @word_controller.check_word_for_letter(@user_guess)

        start_round()
    end

    def get_user_guess
        # Get user input
        @guess = gets.chomp
        @guess = @guess.slice(0, 5)

        # CHEAT
        puts("CHEATER! the word is.. #{@word}") if (@guess == "CHEAT")

        return @guess
    end

    def win_condition?
        @outcome_string = @round_outcome.join
        @count = @outcome_string.count("c")
        @has_won = @count == 5 ? true : false;
    end

    def reset_game
    end

end

@word_con = Word.new('words.txt')
@test = Game.new(@word_con)
@test.start_round()