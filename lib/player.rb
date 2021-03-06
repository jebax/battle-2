class Player
  DEFAULT_HP = 100

  attr_reader :name, :hit_points

  def initialize(name, hit_points = DEFAULT_HP)
    @name = name
    @hit_points = hit_points
  end

  def attack(player)
    player.receive_hit
  end

  def receive_hit
    @hit_points -= Kernel.rand(10)
  end

  def dead?
    @hit_points <= 0
  end
end
