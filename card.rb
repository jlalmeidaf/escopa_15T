class Card
  def initialize valor,naipe
    @valor = valor
    @naipe = naipe
  end
  def valid?
    (1..13).include? @valor
  end
  def value
  	@valor
  end
  def name
  	return "as" if @valor == 1
	return @valor.to_s if @valor > 1 and @valor < 11
	return "valete" if @valor == 11
	return "dama" if @valor == 12
	return "rei" if @valor == 13
  end
  def < card2
	return value < card2.value
  end
end
