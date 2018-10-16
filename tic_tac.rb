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

  puts game

end

perform
