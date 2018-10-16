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
    i=0
    3.times do
      if @board.tab[i+row_nb*3].case == symbol 
        cpt+=1
      end
      i+=1
    end

    if cpt > 2 
      return true 
    else 
      return false 
    end
  end

  def check_column(column_nb, symbol)
    cpt = 0
    i=0
    3.times do
      if @board.tab[i+column_nb].case == symbol 
        cpt+=1
      end
      i+=3
    end
    if cpt > 2  
      return true 
    else 
      return false 
    end 
  end

  def check_diagonals(symbol)
    cpt = 0
    if @board.tab[0].case == symbol 
      cpt+=1 
    end
    if @board.tab[4].case == symbol 
      cpt+=1 
    end
    if @board.tab[8].case == symbol 
      cpt+=1 
    end

    cpt2 = 0
    if @board.tab[2].case == symbol 
      cpt2+=1 
    end
    if @board.tab[4].case == symbol 
      cpt2+=1 
    end
    if @board.tab[6].case == symbol 
      cpt2+=1 
    end

    if (cpt > 2 || cpt2 > 2) 
      return true 
    else 
      return false 
    end 
  end

  def check_victory(player)
    #player.symbol
    @board
    victory = false

    #check rows and columns
    i = 0
    3.times do
      if check_row(i, player.symbol) 
        victory = true 
      end
      if check_column(i, player.symbol) 
        victory = true 
      end
      i+=1
    end
      
    #check diagonal
      if check_diagonals(player.symbol) 
        victory = true
      end

      if victory == true 
        player.state = true
      end

      return victory
  end

end
