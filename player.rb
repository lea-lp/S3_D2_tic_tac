class Player

  attr_accessor :name, :state, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @state = false # if player wins, state == true
  end

end
