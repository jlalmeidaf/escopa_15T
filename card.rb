class Card
  def initialize valor,naipe
    @valor = valor
    @naipe = naipe
  end
  def valid?
    (1..13).include? @valor
  end
end
