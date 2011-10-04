class Player
	def initialize
		@hand = []
	end
	def give_a_card card
		@hand << card
	end
	def number_the_cards_in_the_hand
		@hand.count
	end
	def take_a_card_of_hand position
		card = @hand[position]
		@hand.delete_at position
		card
	end
	def give_back_the_card card
		take_a_card_of_hand card
	end
	
end
