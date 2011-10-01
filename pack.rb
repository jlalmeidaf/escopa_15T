require './card.rb'
require './naipe.rb'
class Pack
  def initialize
    @cartas_validas = []
  end
  def carregar_baralho
    naipes = [Ouros,Paus,Espadas,Copas]
    naipes.each{ |naipe| 
	(1..13).each { |card|
		carta = Card.new card, naipe
		@cartas_validas << carta
	} 
	
	}
  end
end
