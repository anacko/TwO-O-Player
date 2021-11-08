class Board

  def initialize(number_of_players = 2, max_life = 3)
    @number_of_players = number_of_players
    @players_current_lives = Array.new(number_of_players, max_life)
  end

  def add_player(max_life = 3)
    @number_of_players += 1
    @players_current_lives << max_life
  end

end