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
			cards_from_board = []
			cartas.each { |card| the_card = mesa.look_card(card); cards_from_board << the_card ;}
			cards_from_board.each { |card| mesa.give_a_card card }
			cards_for_scopa << cards_from_board
			cards_for_scopa.flatten!
			scopa = Scopa.new(cards_for_scopa)
			@scopas << scopa
			
		end
	end
	def number_of_scopas
		@scopas.count
	end
	def score
		pontos = 0
		@scopas.each{|scopa| pontos += 1}
		if number_of_seven() == 4
			pontos += 3
		end
		pontos		
	end
	def number_of_seven
		sevens = 0
		@hand.each{|card| sevens +=1 if card.value_for_escopa == 7}
		
		@scopas.each { |scopa_list| cards = scopa_list.cards();
				cards.each { |card| sevens +=1 if card.value_for_escopa == 7 }
			     }
		sevens
	end
	
end
