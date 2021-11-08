class Board

  def initialize(number_of_players = 2, max_lives = 3)
    @number_of_players = number_of_players
    @players_current_lives = Array.new(number_of_players, max_lives)
  end

  def add_player(max_lives = 3)
    @number_of_players += 1
    @players_current_lives << max_lives
  end

  def update_life(player, new_life)
    @players_current_lives[player] = new_life
  end

  attr_accessor :players_current_lives

end