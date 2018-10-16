require_relative 'board'
require_relative 'player'


class Game

  attr_accessor :players, :board, :nb_turn

  def initialize(player1, player2)
    @players = [player1, player2]
    @board = Board.new
    @nb_turn = 0
  end

end
