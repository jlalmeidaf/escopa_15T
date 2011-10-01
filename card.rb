class Card
  def initialize valor
    @valor = valor
  end
  def valid?
    (1..13).include? @valor
  end
end

class Naipe
  
end

class Ouros < Naipe
  
end

class Paus < Naipe
  
end

class Copas < Naipe
  
end

class Espadas < Naipe
  
end 
