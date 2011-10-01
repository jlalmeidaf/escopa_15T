require './card.rb'
require './naipe.rb'
class Pack
  def initialize
    @cartas_validas = []
  end
  def load_pack
    naipes = [Ouros,Paus,Espadas,Copas]
    naipes.each{ |naipe| 
	(1..13).each { |card|
		carta = Card.new card, naipe
		@cartas_validas << carta
	} 
	
	}
  end
  def left_cards
  	@cartas_validas.size
  end
  def shuffle
  	@cartas_validas.shuffle!
  end
  def remove_cards_of_value value
	@cartas_validas.each { |card| 
				@cartas_validas.delete card if card.value == value
			      }
  end
end
