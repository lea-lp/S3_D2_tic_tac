

class BoardCase

  attr_reader :case

  def initialize
    #initialisation des cases du tableau vides
    @case = " "
  end

  def set_case(symbol)
    #remplacement de la case initiale par symbole de Players
    if @case == " "
      @case = symbol
      return true
    else
      return false
    end
  end

end
