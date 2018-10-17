require 'game'

describe Game do
  let(:player_1) { double(:player, name: "Joel", dead?: false) }
  let(:player_2) { double(:player, name: "Chloe") }
  let(:dead_player) { double(:player, name: "Dead", hit_points: 0, dead?: true) }
  let(:game_1) { Game.new(player_1, player_2) }
  let(:game_2) { Game.new(player_1, dead_player) }
  it 'should start with two players' do
    expect(game_1.player_1.name).to eq "Joel"
    expect(game_1.player_2.name).to eq "Chloe"
  end

  it 'should start with player_1 as the active player' do
    expect(game_1.active_player).to eq player_1
  end

  describe "#attack" do
    it 'should be able to attack a player' do
      expect(player_2).to receive(:receive_hit)
      game_1.attack
    end
  end

  describe "#switch_turns" do
    it 'can switch turns on attacking' do
      allow(player_2).to receive(:receive_hit)
      game_1.attack
      expect(game_1.active_player).to eq player_2
    end
  end

  describe "#finished?" do
    it "will finish the game if either player's HP drops to 0" do
      allow(dead_player).to receive(:receive_hit)
      game_2.attack
      expect(game_2.finished?).to eq true
    end
  end
end
