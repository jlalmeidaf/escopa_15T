require './board.rb'
describe Board do
	before(:each) do
	  @board = Board.new
	end
	it 'Colocar uma carta na mesa' do
		carta = double()
		@board.push_card_in_the_board carta
		@board.number_the_cards_in_the_board.should == 1
	end
	it 'Tirar uma carta' do
		carta = double()
		@board.push_card_in_the_board carta
		@board.number_the_cards_in_the_board.should == 1
		@board.give_a_card carta
		@board.number_the_cards_in_the_board.should == 0
	end
	it 'Ver uma carta na mesa' do
		carta = double()
		@board.push_card_in_the_board carta
		carta_olhada = @board.look_card 0
		carta_olhada.should == carta
		@board.number_the_cards_in_the_board.should == 1
	end
end
