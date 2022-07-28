class Word 

    attr_reader :word

    def initialize(textFile)
        @text_array =  File.read(textFile).split
        @word = choose_random_word()
    end

    def choose_random_word
        @random_choice = rand(@text_array.length - 1).floor
        @word = @text_array[@random_choice].upcase
        puts @word
        
        return @word
    end

    def check_word_for_letter(guess)
        @row_status = []
        @word_array = @word.split("");
        @guess_array = guess.split("");

        @guess_array.each_with_index {|cl, i|
            # Does the letter exist in the word?
            # Can oop and overwrite letter to save lines
            @word_array.each { |l| 
                if (l == @guess_array[i]) 
                    @row_status[i] = "m"
                    break 
                else
                    @row_status[i] = "x"
                end
            }

            # Is the letter correct place?
            if (@guess_array[i] == @word_array[i]) 
                @row_status[i] = "c"
            end;
        }

        return @row_status
    end

end
