class Game

  def initialize(limit_number = 20, number_of_players = 2)
    @limit_number = limit_number
    @current_player = 1
    @number_of_players = number_of_players
  end

  def make_random
    @number_1 = rand(@limit_number)+1
    @number_2 = rand(@limit_number)+1
    @result_added = @number_1 + @number_2
  end

  def pass_turn
    if @current_player < @number_of_players
      @current_player += 1
    else
      @current_player = 1
    end
  end

  attr_reader :number_1, :number_2, :result_added, :current_player

end