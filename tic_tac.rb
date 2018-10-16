require_relative 'game'
require_relative 'player'
require_relative 'board'


def perform

  puts ">> Welcome to the BEST tic-tac-toe game EVER << \n"
  #création player 1
  puts "Player 1 (you'll be - X -): choose your name"
  print "> "
  name_p1 = gets.chomp
  player1 = Player.new(name_p1, "X")
  #création player 2
  puts "Player 2 (you'll be - O -): choose your name"
  print "> "
  name_p2 = gets.chomp
  player2 = Player.new(name_p2, "O")
  # initialisation du jeu
	game = Game.new(player1, player2)

  #début du jeu !
  while (game.nb_turn < 9)

		#choix du joueur (si le tour est pair > player1, & impair > player2)
    player = game.players[(game.nb_turn)%2]
    #affichage des tableaux BOARD GAME & BOARD POSITION
    game.board.display

    puts "It is your turn #{player.name} ! "
    puts "Choose where you want to play"
    print "> "
		position = gets.chomp.to_i
    #si choix en dehors du tableau BOARD POSITION, on loop la question
    while position < 0 || position > 8
      puts "Wrong choice, choose btw 0 and 8 please :)"
      print "> "
      position = gets.chomp.to_i
    end
    #si case déjà occupée, on loop la question
		while !game.board.tab[position].set_case(player.symbol)
      puts "Case already taken, please enter one of the remaining numbers on the BOARD POSITION"
      print "> "
      position = gets.chomp.to_i
    end
    #lancement de vérification de 'check_victory' au bout du 5ème tour
		if (game.nb_turn >= 4)
			if game.check_victory(player)
        game.board.display
				break
			end
		end

		game.nb_turn += 1
	end

  #fin de la partie, affichage du score final
	if (game.players[0].state)
		puts "#{game.players[0].name} win !!!"
	elsif (game.players[1].state)
		puts "#{game.players[1].name} win !!!"
	else
		puts "Tie game ..."
	end

end

perform
