class Player

  def initialize(player_number, max_lives = 3)
    @player = player_number
    @max_lives = max_lives
    @current_lives = @max_lives
  end

  def lose_life
    @current_lives -= 1
  end

  attr_accessor :current_lives

end