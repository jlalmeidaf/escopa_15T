require './card.rb'

describe Card do
  before(:each) do
    @naipe = double()
  end
  it 'carta eh valida' do
    card = Card.new 5, @naipe
    card.valid?.should == true
  end
  it 'carta eh invalida quando menor que 1' do
    card = Card.new 0, @naipe
    card.valid?.should == false
  end
  it 'carta eh invalida quando maior do que 13' do
    card = Card.new 14, @naipe
    card.valid?.should == false
  end
  it 'valor da carta' do
	value = double()
	card = Card.new value, @naipe
	card.value.should == value
  end
  it 'nome das cartas' do
  	card = Card.new 1, @naipe
	card.name.should == "as"
	card = Card.new 2, @naipe
	card.name.should == "2"
	card = Card.new 7, @naipe
	card.name.should == "7"
	card = Card.new 10, @naipe
	card.name.should == "10"
	card = Card.new 11, @naipe
	card.name.should == "valete"
	card = Card.new 12, @naipe
	card.name.should == "dama"
	card = Card.new 13, @naipe
	card.name.should == "rei"
  end
  it 'Verificar se uma carta eh menor do que outra' do
  	card = Card.new 1, @naipe
	card2 = Card.new 2, @naipe
	card.<(card2).should == true
  end
  it 'Verficar se uma carta nao eh menor do que outra' do
  	card = Card.new 2, @naipe
	card2 = Card.new 1, @naipe
	card.<(card2).should == false  	
  end
  it 'Valor das cartas para escopa de 15' do
  	card = Card.new 1, @naipe
	card.value_for_escopa.should == 1
	card = Card.new 2, @naipe
	card.value_for_escopa.should == 2
	card = Card.new 7, @naipe
	card.value_for_escopa.should == 7
	card = Card.new 11, @naipe
	card.value_for_escopa.should == 8
	card = Card.new 12, @naipe
	card.value_for_escopa.should == 9
	card = Card.new 13, @naipe
	card.value_for_escopa.should == 10
  end
end
