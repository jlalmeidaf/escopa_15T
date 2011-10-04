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

	
end

