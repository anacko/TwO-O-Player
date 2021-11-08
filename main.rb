require './player.rb'
require './board.rb'
require './game.rb'

# Greetings (In the future, will offer settings)

puts "Welcome to TwO-O-Player Math Game!"
start = ''
while !(start.downcase == 's' || start.downcase == 'e')
  puts "Let's get started! (enter S to start or E for settings)"
  start = $stdin.gets.chomp
end

# Starting parameters

if start.downcase == 'e'
  puts "How many players? (Default: 2)"
  number_of_players = $stdin.gets.chomp.to_i
  
  puts "How many starting lives? (Default: 3)"
  max_lives = $stdin.gets.chomp.to_i

  puts "What is the limit number? (Default: 20)"
  limit_number = $stdin.gets.chomp.to_i
end

if start.downcase == 's'
  number_of_players = 2
  max_lives = 3
  limit_number = 20
end

puts "This is a #{number_of_players}-player Math Game. Each player starts #{max_lives} lives."

# Game Starts
players = []
(1..number_of_players).each { |player| players << Player.new(player, max_lives) }

board = Board.new(number_of_players, max_lives)
game = Game.new(limit_number, number_of_players)

# Turns turn...
while (!board.players_current_lives.include?(0))
  
  puts "----- New Turn! -----"
  # Gets random numbers
  game.make_random

  # Current player plays
  puts "Player #{game.current_player}: What does #{game.number_1} plus #{game.number_2} equal?"
  puts "REMOVE LATER: RESULT = #{game.result_added}"
  player_answer = $stdin.gets.chomp

  # Compare answers
  if player_answer.to_i != game.result_added
    puts "Seriously? No!"
    player_pos = game.current_player - 1 
    players[player_pos].lose_life
    board.update_life(player_pos, players[player_pos].current_lives)
  end
  
  (1..number_of_players).each { |player| puts "Player #{player}: #{players[player -1].current_lives}/#{max_lives}" }
  game.pass_turn

end

puts "----- Game Over! -----"
puts "Player #{board.players_current_lives.find_index(0) + 1} Loses."