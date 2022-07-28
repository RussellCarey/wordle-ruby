require_relative '../word.rb'
require_relative '../game.rb'

describe Word do

    before :each do
        @word_controller = Word.new('./Files/test_words.txt')
        @game_controller = Game.new(@word_controller)
    end
 
    it "Generate correct array from text file" do
        expect(@word_controller.text_array).to contain_exactly("which", "there")
    end

    it "Chooses a random word from a created array" do
        expect(@word_controller.word).to eq("WHICH").or eq("THERE")
    end

    it "Checks word - if all status (x c m) are correctly identified and reported back" do
        partial_correct_word = @word_controller.word == "WHICH" ? "WHIHZ" : "THEEZ"
        expect(@word_controller.check_word_for_letter(partial_correct_word)).to contain_exactly("c", "c", "c", "m", "x")
    end
    
end