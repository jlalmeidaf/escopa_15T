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
  def pop_card
  	@cartas_validas.pop
  end
  def give_a_card card
  	@cartas_validas << card
  end
  def prepare_for_scope
    remove_cards_of_value 8
    remove_cards_of_value 9
    remove_cards_of_value 10
  	
  end
end
#class PackScope < Pack
#	def initialize
#		super

#	end
#end
