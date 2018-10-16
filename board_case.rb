class BoardCase

  attr_reader :case

  def initialize
    @case = " "
  end

  def set_case(symbol)
    if symbol == "X" || symbol == "O" || symbol == " "
      @case = symbol
    else
      puts "Wrong symbol"
    end
  end


end
