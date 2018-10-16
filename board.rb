require_relative 'board_case'

class Board

  attr_accessor :tab

  def initialize
    @tab = Array.new
    for i in 0..8
      @tab[i] = BoardCase.new
    end
    # @tab.each {|i| @tab[i] = BoardCase.new * 8}
  end

end
