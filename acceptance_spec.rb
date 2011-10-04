require './board.rb'
require './player.rb'
describe 'Jogo Escopa de 15' do
	before(:each) do
		@mesa = Board.new
		@jogador1 = Player.new
		@jogador2 = Player.new
		@baralho = Pack.new
		@baralho.load_pack
		@baralho.prepare_for_scope
	end
	it 'inicia o jogo' do
		@baralho.shuffle
		card = @baralho.pop_card
		card2 = @baralho.pop_card
		@jogador1.give_a_card card
		@jogador2.give_a_card card2
		card =  @jogador1.take_a_card_of_hand 0
		card2 = @jogador2.take_a_card_of_hand 0	
		card.<(card2) or card2.<(card) == true
		card = @jogador1.give_back_the_card 0
		card2 = @jogador2.give_back_the_card 0
		@baralho.give_a_card card
		@baralho.give_a_card card2
		@baralho.shuffle
		4.times {
			card = @baralho.pop_card
			@mesa.push_card_in_the_board card
		}
		@baralho.left_cards.should == 36
		3.times{
			card = @baralho.pop_card
			@jogador1.give_a_card card
			card2 = @baralho.pop_card
			@jogador2.give_a_card card2

		}
		@baralho.left_cards.should == 30
		
	end
end
