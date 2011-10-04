require './board.rb'
describe Board do
	before(:each) do
	  @board = Board.new
	end
	it 'Colocar uma carta na mesa' do
		card = double()
		@board.push_card_in_the_board card
		@board.number_the_cards_in_the_board.should == 1
	end
	it 'Tirar uma carta de uma posicao' do
		card = double()
		@board.push_card_in_the_board card
		@board.give_a_card(0).should == card
		@board.number_the_cards_in_the_board.should == 0
	end
end
