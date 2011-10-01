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
end
