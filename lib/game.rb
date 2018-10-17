class Game
  attr_reader :player_1, :player_2

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @turn = @player_1
  end

  def attack
    non_active_player.receive_hit
    switch_turns
  end

  def non_active_player
    if @turn == @player_1
      return @player_2
    else
      return @player_1
    end
  end

  def active_player
    @turn
  end

  private

  def switch_turns
    @turn = non_active_player
  end
end
