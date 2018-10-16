class Player

  attr_accessor :name, :state, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @state = false # si player gagne, state = true
  end

end
