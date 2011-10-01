require './card.rb'

describe Card do
  it 'carta eh valida' do
    card = Card.new 5
    card.valid?.should == true
  end
  it 'carta eh invalida quando menor que 1' do
    card = Card.new 0
    card.valid?.should == false
  end
  it 'carta eh invalida quando maior do que 13' do
    card = Card.new 14
    card.valid?.should == false
  end
end
