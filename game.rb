require_relative 'board'
require_relative 'player'


class Game

  attr_accessor :players, :board, :nb_turn

  def initialize(player1, player2)
    @players = [player1, player2]
    @board = Board.new
    @nb_turn = 0
  end


  def check_row(row_nb, symbol)
    cpt = 0

    for i in (0..2)
      (@board.tab[i + row_nb * 3].case == symbol) ? cpt += 1 : nil
    end

    cpt > 2 ? result = true : result = false
    return result
  end


  def check_column(column_nb, symbol)
    cpt = 0

    for i in (0..2)
      (@board.tab[(i * 3) + column_nb].case == symbol) ? cpt += 1 : nil
    end

    cpt > 2 ? result = true : result = false
    return result
  end


  def check_diagonals(symbol)
    cpt_1 = 0
    cpt_2 = 0

    for i in (0..2)
      (@board.tab[(i * 4)].case == symbol) ? cpt_1 += 1 : nil
    end
    for i in (0..2)
      (@board.tab[(i * 2) + 2].case == symbol) ? cpt_2 += 1 : nil
    end

    (cpt_1 > 2 || cpt_2 > 2) ? result = true : result = false
    return result
  end


  def check_victory(player)
    victory = false

    #check rows and columns
    for i in (0..2)
      check_row(i, player.symbol) ? victory = true : nil
      check_column(i, player.symbol) ? victory = true : nil
    end
    #check diagonal
    check_diagonals(player.symbol) ? victory = true : nil
    #changement statut du player
    victory == true ? player.state = true : nil

    return victory

  end

end
