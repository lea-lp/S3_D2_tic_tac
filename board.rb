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


  def display_number
    i=0
    3.times do
      c1 = ""
      c2 = ""
      c3 = ""
      tab[i].case == " " ? c1=i : c1=" "
      tab[i+1].case == " " ? c2=i+1 : c2=" "
      tab[i+2].case == " " ? c3=i+2 : c3=" "     

      print "   #{c1} | #{c2} | #{c3} \n"
      if(i < 6)
        print "   _ . _ . _ \n"
      end
      i = i +3
    end
  end

  def display_board
    i=0
    3.times do
      print "   #{tab[i].case} | #{tab[i+1].case} | #{tab[i+2].case} \n"
      if(i < 6)
        print "   _ . _ . _ \n"
      end
      i = i +3
    end 
  end

end
