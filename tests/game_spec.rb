require_relative '../word.rb'
require_relative '../game.rb'

describe Word do

    before :each do
        @word_controller = Word.new('./Files/test_words.txt')
        @game_controller = Game.new(@word_controller)
    end
 
    it "Detects that the status row has all correct letters" do
        correct_win_condition = ['c','c','c','c','c']
        is_a_win =  @game_controller.win_condition?(correct_win_condition)
        expect(is_a_win).to eq(true)
    end
end