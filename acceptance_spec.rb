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
	it 'Sorteio de quem ira comecar' do
		@baralho.shuffle
		card = @baralho.pop_card
		card2 = @baralho.pop_card
		@jogador1.give_a_card card
		@jogador2.give_a_card card2
		card =  @jogador1.take_a_card_of_hand 0
		card2 = @jogador2.take_a_card_of_hand 0	
		card.<(card2) or card2.<(card) == true
	end
	it "Colocando inicialmente as cartas na mesa e primeira distribuicao de cartas" do
		@baralho.shuffle
		card = @baralho.pop_card
		card2 = @baralho.pop_card
		@jogador1.give_a_card card
		@jogador2.give_a_card card2
		card =  @jogador1.take_a_card_of_hand 0
		card2 = @jogador2.take_a_card_of_hand 0	
		card.<(card2) or card2.<(card) == true
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
	it "Colocar uma carta na mesa" do
		card = double()
		@jogador1.give_a_card card
		carta_descartada = @jogador1.take_a_card_of_hand 0
		@mesa.push_card_in_the_board carta_descartada
		@jogador1.number_the_cards_in_the_hand.should == 0
		@mesa.number_the_cards_in_the_board == 1
	end

		
	it "pegar uma escopa" do
		naipe = double()
		card_rei = Card.new 13, naipe
		card_quatro = Card.new 4, naipe
		card_as =  Card.new 1, naipe
		@jogador1.give_a_card card_rei
		@mesa.push_card_in_the_board card_quatro
		@mesa.push_card_in_the_board card_as
		@jogador1.scopa(0,@mesa,[0,1])
		@jogador1.number_of_scopas.should == 1
	end
	it "verificar ganhador" do
		naipe = double()
		card_rei = Card.new 13, naipe
		card_quatro = Card.new 4, naipe
		card_as =  Card.new 1, naipe
		@jogador1.give_a_card card_rei
		@mesa.push_card_in_the_board card_quatro
		@mesa.push_card_in_the_board card_as
		@jogador1.scopa(0,@mesa,[0,1])
		@jogador1.score.should == 1
		@jogador2.score.should == 0
	end
end
