require 'game'

describe Game do
  let(:player_1) { double(:player, name: "Joel") }
  let(:player_2) { double(:player, name: "Chloe") }
  let(:game_1) { Game.new(player_1, player_2) }
  it 'should start with two players' do
    expect(game_1.player_1.name).to eq "Joel"
    expect(game_1.player_2.name).to eq "Chloe"
  end

  describe "#attack" do
    it 'should be able to attack a player' do
      expect(game_1.player_2).to receive(:receive_hit)
      game_1.attack
    end
  end
end
