require './pack.rb'
class Board
	def initialize
		
#		class Card
#			def value
#				 self.value < 8 ? self.value : self.value - 3
#			end
#		end
		@baralho = Pack.new
	end
	def pack_prepare
		@baralho.remove_cards_of_value 8
		@baralho.remove_cards_of_value 9
		@baralho.remove_cards_of_value 10
		
	end
	
end

