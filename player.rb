require './scopa.rb'
class Player
	def initialize
		@hand = []
		@scopas = []
		
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
	def scopa(card,mesa, cartas)		
		soma = @hand[card].value_for_escopa
		cartas.each { |card| the_card = mesa.look_card(card); the_card_value = the_card.value_for_escopa; soma = soma + the_card_value }
		if soma == 15
			my_card = take_a_card_of_hand card
			cards_for_scopa = [my_card]
			cartas.each { |card| the_card = mesa.give_a_card(card); cards_for_scopa << the_card }
			@scopas << Scopa.new(cards_for_scopa)
		end
	end
	def number_of_scopas
		@scopas.count
	end
	def score
		pontos = 0
		@scopas.each{|scopa| pontos += 1}
		pontos		
	end
end
