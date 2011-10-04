require './pack.rb'
describe Pack do
  before(:each) do
    @baralho = Pack.new
    @baralho.load_pack
  end
  it 'carga do baralho' do
    @baralho.left_cards.should == 52
  end
  it 'Remover cartas 8,9,10' do
  	@baralho.remove_cards_of_value 8
	@baralho.remove_cards_of_value 9
	@baralho.remove_cards_of_value 10
	@baralho.left_cards.should == 40
  end
  it 'Pegar a carta de cima' do
  	carta = @baralho.pop_card
	carta.class.should == Card
  end
  it 'Tentar pegar uma carta no baralho vazio' do
  	52.times {
		@baralho.pop_card
  	}
	carta = @baralho.pop_card
	carta.should == nil
  end
end
