require_relative 'game'
require_relative 'player'
require_relative 'board'
require 'colorize'


def perform

  puts "\n 🔥  >>> Welcome to the BEST tic-tac-toe game EVER <<< 🔥 \n \n"
  #création player 1
  puts "Player 1 (you'll be ☄️ ), choose your name :"
  print "> "
  name_p1 = gets.chomp
  player1 = Player.new(name_p1, "☄️")
  #création player 2
  puts "Player 2 (you'll be ❄️ ), choose your name :"
  print "> "
  name_p2 = gets.chomp
  player2 = Player.new(name_p2, "❄️")
  # initialisation du jeu
	game = Game.new(player1, player2)

  #début du jeu !
  while (game.nb_turn < 9)

		#choix du joueur (si le tour est pair > player1, & impair > player2)
    player = game.players[(game.nb_turn)%2]
    if (game.nb_turn)%2 == 1
      puts "It's your turn #{player.name} #{player.symbol} ! ".cyan
    else
      puts "It's your turn #{player.name} #{player.symbol} ! ".light_red
    end
    #affichage des tableaux BOARD GAME & BOARD POSITION
    game.board.display

    # puts "It is your turn #{player.name} (#{player.symbol}) ! "
    puts "Choose where you want to play".green
    print "> "
		position = gets.chomp.to_i
    #si choix en dehors du tableau BOARD POSITION, on loop la question
    while (position < 0 || position > 8)
      puts "🔢  Wrong choice, choose btw 0 and 8 please :) 🔢".light_blue
      print "> "
      position = gets.chomp.to_i
    end
    #si case déjà occupée, on loop la question
		while (!game.board.tab[position].set_case(player.symbol))
      puts "🚫  Case already taken, please enter one of the remaining numbers on the BOARD POSITION 🚫".red
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
		puts "🎉 🎉 🎉  #{game.players[0].name} WINS !!! 🎉 🎉 🎉".upcase.light_red
	elsif (game.players[1].state)
		puts "🎉 🎉 🎉  #{game.players[1].name} WINS !!! 🎉 🎉 🎉".upcase.cyan
	else
		puts "💩  TIE GAME 💩"
	end

end

perform
