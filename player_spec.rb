require './pack.rb'
require './player.rb'
require './card.rb'
require './board.rb'
describe Player do
	it 'Jogador pega uma carta do baralho' do
		baralho = Pack.new
		jogador = Player.new
		baralho.load_pack
		carta = baralho.pop_card
		jogador.give_a_card carta
		jogador.number_the_cards_in_the_hand.should == 1
	end
	it 'Jogador tira uma carta da mao' do
		baralho = Pack.new
		jogador = Player.new
		baralho.load_pack
		carta = baralho.pop_card
		jogador.give_a_card carta
		carta = jogador.take_a_card_of_hand 0
		carta.class.should == Card
	end	
	it 'Jogador tenta tirar uma carta do baralho vazio' do
		jogador = Player.new
		carta = jogador.take_a_card_of_hand 0
		carta.class.should == NilClass
	end
	it 'Pontuacao com quatro cartas sete' do
		mesa = Board.new		
		naipe = double()
		jogador = Player.new
		2.times{	
			2.times{
				naipe = double()
				carta = Card.new 7, naipe
				mesa.push_card_in_the_board carta
				}
			carta_as = Card.new 1, naipe
			jogador.give_a_card carta_as
			jogador.scopa(0,mesa,[0,1])
		}
		jogador.score.should == 5		

	end

end
