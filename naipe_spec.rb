require './naipe.rb'

describe Naipe do
	it 'Naipe de Ouros' do
		Ouros.should == Ouros
	end
	it 'Naipe de Paus' do
		Paus.should == Paus
	end
	it 'Naipe de Copas' do
		Copas.should == Copas
	end
	it 'Naipe de Espadas' do
		Espadas.should == Espadas
	end
end
