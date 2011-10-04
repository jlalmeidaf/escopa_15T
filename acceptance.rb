describe 'Jogo Escopa de 15' do
	before(:each) do
		@mesa = Board.new
		@jogador1 = Player.new
		@jogador2 = Player.new
		@baralho = Pack.new
	end
	it 'inicia o jogo' do
		@baralho.shuffle
		@jogador1.give_a_card_of @baralho
		@jogador2.give_a_card_of @baralho
	end
end
