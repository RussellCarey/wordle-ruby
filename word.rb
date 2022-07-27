class Word 

    attr_reader :word

    def initialize(textFile)
        @text_array =  File.read(textFile).split
        @word = nil
    end

    def choose_random_word
        @random_choice = rand(@text_array.length - 1).floor
        @word = @text_array[@random_choice]
    end

    def check_word_for_letter(guess)
        @row_status = []
        @word_array = @word.split(//);
        @guess_array = guess.split(//);

        @guess_split.each_with_index { |cl, i|

            # Go through each and check if its in the word or not.
            @word_array.each_with_index { |l, i| 
                if (l == @guess[index]) 
                    @row_status[index] = "m"
                    break 
                else
                    @row_status[index] = "x"
                end

                # Is the letter correct place, if so overwrite
                if (@guess[index] == @word[index]) 
                    @row_status[index] = "c"
                end;
            }
        }

        return @row_status
    end
end
