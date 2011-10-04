require './board.rb'
describe Board do
	before(:each) do
	  @board = Board.new
	end
	it 'Preparar o baralho para o Jogo' do
		@board.pack_prepare
	end
end
