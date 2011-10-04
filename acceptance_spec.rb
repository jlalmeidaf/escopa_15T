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
		carta = @baralho.pop_card
		carta2 = @baralho.pop_card
		@jogador1.give_a_card carta
		@jogador2.give_a_card carta2
		carta =  @jogador1.take_a_card_of_hand 0
		carta2 = @jogador2.take_a_card_of_hand 0	
		carta.<(carta2) or carta2.<(carta) == true
	end
	it "Colocando inicialmente as cartas na mesa e primeira distribuicao de cartas" do
		@baralho.shuffle
		carta = @baralho.pop_card
		carta2 = @baralho.pop_card
		@jogador1.give_a_card carta
		@jogador2.give_a_card carta2
		carta =  @jogador1.take_a_card_of_hand 0
		carta2 = @jogador2.take_a_card_of_hand 0	
		carta.<(carta2) or carta2.<(carta) == true
		@baralho.give_a_card carta
		@baralho.give_a_card carta2
		@baralho.shuffle
		4.times {
			carta = @baralho.pop_card
			@mesa.push_card_in_the_board carta
		}
		@baralho.left_cards.should == 36
		3.times{
			card = @baralho.pop_card
			@jogador1.give_a_card carta
			card2 = @baralho.pop_card
			@jogador2.give_a_card carta2

		}
		@baralho.left_cards.should == 30
	end
	it "Colocar uma carta na mesa" do
		carta = double()
		@jogador1.give_a_card carta
		carta_descartada = @jogador1.take_a_card_of_hand 0
		@mesa.push_card_in_the_board carta_descartada
		@jogador1.number_the_cards_in_the_hand.should == 0
		@mesa.number_the_cards_in_the_board == 1
	end

		
	it "pegar uma escopa" do
		naipe = double()
		carta_rei = Card.new 13, naipe
		carta_quatro = Card.new 4, naipe
		carta_as =  Card.new 1, naipe
		@jogador1.give_a_card carta_rei
		@mesa.push_card_in_the_board carta_quatro
		@mesa.push_card_in_the_board carta_as
		@jogador1.scopa(0,@mesa,[0,1])
		@jogador1.number_of_scopas.should == 1
	end
	it "verificar ganhador" do
		naipe = double()
		carta_rei = Card.new 13, naipe
		carta_quatro = Card.new 4, naipe
		carta_as =  Card.new 1, naipe
		@jogador1.give_a_card carta_rei
		@mesa.push_card_in_the_board carta_quatro
		@mesa.push_card_in_the_board carta_as
		@jogador1.scopa(0,@mesa,[0,1])
		@jogador1.score.should == 1
		@jogador2.score.should == 0
	end
end
