require_relative 'board_case'

class Board

  attr_accessor :tab

  def initialize
    #création d'un tableau de 9 cases (correspondant au Board)
    #chaque case contient l'objet de BoardCase
    @tab = Array.new
    for i in 0..8
      @tab[i] = BoardCase.new
    end
  end

  def display
    #renvoi deux tableaux côte à côte
    #un tableau de jeu (BOARD) + un tableau des positions disponibles (BOARD POSITIONS)
    print "\n   BOARD          BOARD \n"
    print "   GAME           POSITIONS \n"
    i = 0
    3.times do
      # synthaxe '? ... :' équivalent à 'if ... end'
      tab[i].case == " " ? c1 = i : c1 = " "
      tab[i+1].case == " " ? c2 = i + 1 : c2 = " "
      tab[i+2].case == " " ? c3 = i + 2 : c3 = " "

      print "   #{tab[i].case} | #{tab[i+1].case} | #{tab[i+2].case}"
      print "      #{c1} | #{c2} | #{c3} \n"
      if(i < 6)
        print "   _ . _ . _"
        print "      _ . _ . _ \n"
      end
      i = i + 3
    end
    print "\n"
  end

end
