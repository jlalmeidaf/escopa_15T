require './pack.rb'
describe Pack do
  before(:each) do
    @pack = Pack.new
    @pack.load_pack
  end
#  it '[!] Carga do baralho' do
#    pack = Pack.new
#    pack.carregar_baralho
#    pack.cartas_restantes.should == 52
#  end
#  it '[!] Embaralhar baralho' do
#  	pack = Pack.new
#	pack.embaralhar	
#  end
  it 'Remover cartas 8,9,10' do
  	@pack.remove_cards_of_value 8
	@pack.remove_cards_of_value 9
	@pack.remove_cards_of_value 10
	@pack.left_cards.should == 40
  end
end
