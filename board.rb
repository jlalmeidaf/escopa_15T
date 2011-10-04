require './pack.rb'
class Board
	def initialize
		@board_cards = []
	end

	def push_card_in_the_board card
		@board_cards << card
	end
	def number_the_cards_in_the_board
		@board_cards.count
	end
	def look_card card_number
		@board_cards[card_number]
	end
	def give_a_card card
		@board_cards.delete card
		
	end
	def delete_a_card card
		@board_cards.delete card
	end

	
end

