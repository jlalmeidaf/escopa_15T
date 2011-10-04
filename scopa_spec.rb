describe Scopa do
	it 'Verifica as cartas de uma escopa' do
		lista_de_cartas = []
		5.times{
			carta = double(:card)
			lista_de_cartas << carta
			}
		escopa = Scopa.new lista_de_cartas
		escopa.cards.should == lista_de_cartas		
	end
end
