require './pack.rb'
require './player.rb'
describe Player do
	it 'Jogador pega uma carta do baralho' do
		baralho = Pack.new
		jogador = Player.new
		baralho.load_pack
		card = baralho.pop_card
		jogador.give_a_card card
		jogador.number_the_cards_in_the_hand.should == 1
	end
	it 'Jogador tira uma carta da mao' do
		baralho = Pack.new
		jogador = Player.new
		baralho.load_pack
		card = baralho.pop_card
		jogador.give_a_card card
		card = jogador.take_a_card_of_hand 0
		card.class.should == Card
	end	
	it 'Jogador tenta tirar uma carta do baralho vazio' do
		jogador = Player.new
		card = jogador.take_a_card_of_hand 0
		card.class.should == NilClass
	end

end