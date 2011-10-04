require './pack.rb'
describe Pack do
  before(:each) do
    @pack = Pack.new
    @pack.load_pack
  end
  it 'carga do baralho' do
    pack = Pack.new
    pack.load_pack
    pack.left_cards.should == 52
  end
  it 'Remover cartas 8,9,10' do
  	@pack.remove_cards_of_value 8
	@pack.remove_cards_of_value 9
	@pack.remove_cards_of_value 10
	@pack.left_cards.should == 40
  end
  it 'Pegar a carta de cima' do
  	card = @pack.pop_card
	card.class.should == Card
  end
  it 'Tentar pegar uma carta no baralho vazio' do
  	52.times {
		@pack.pop_card
  	}
	card = @pack.pop_card
	card.should == nil
  end
end
