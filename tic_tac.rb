require_relative 'game'
require_relative 'player'
require_relative 'board'
# require_relative 'board_case'


def perform

  puts "Welcome to the BEST tic-tac-toe game EVER"

  puts "Player 1 (you'll be -X-): choose your name"
  print "> "
  name_p1 = gets.chomp
  player1 = Player.new(name_p1, "X")

  puts "Player 2 (you'll be -O-): choose your name"
  print "> "
  name_p2 = gets.chomp
  player2 = Player.new(name_p2, "O")

	game = Game.new(player1, player2)

  #start game
  while (game.nb_turn < 9)

		#Choose player
    player = game.players[(game.nb_turn)%2]

    puts "It is your turn #{player.name} ! "
    game.board.display_number
    puts "Choose where you want to play"
    print "> "
		position = gets.chomp.to_i

		game.board.tab[position].set_case(player.symbol)

		game.board.display_board

		

		if (game.nb_turn >= 4)
			if game.check_victory(player)
				break
			end 
		end

		#Display end of game

		game.nb_turn += 1
	end
	
	if (game.players[0].state)
		puts "#{game.players[0].name} win !!!"
	elsif (game.players[1].state)
		puts "#{game.players[1].name} win !!!"
	else
		puts "Tie game ..."
	end

end

perform
