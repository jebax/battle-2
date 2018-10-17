class Game
  attr_reader :player_1, :player_2

  @current_game = nil

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @turn = @player_1
  end

  def self.store_game(game)
    @current_game = game
  end

  def self.current_game
    @current_game
  end

  def attack
    non_active_player.receive_hit
    switch_turns
  end

  def non_active_player
    return @player_2 if @turn == @player_1
    @player_1
  end

  def active_player
    @turn
  end

  def finished?
    @player_1.dead? || @player_2.dead?
  end

  private

  def switch_turns
    @turn = non_active_player
  end
end
