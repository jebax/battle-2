require 'player'

describe Player do
  let(:joel) { Player.new("Joel") }
  let(:chloe) { Player.new("Chloe") }

  it 'should have a name' do
    expect(joel.name).to eq "Joel"
  end

  describe "#hit_points" do
    it 'should have default hit points of 100' do
      expect(joel.hit_points).to eq described_class::DEFAULT_HP
    end

    it 'should be able to specify a different max hp' do
      john = Player.new("John", 123)
      expect(john.hit_points).to eq 123
    end

    it 'will reduce by 10 when hit' do
      expect { joel.receive_hit }.to change { joel.hit_points }.by(-10)
    end
  end

  describe "#attack" do
    it 'can attack a different player' do
      joel.attack(chloe)
      expect(chloe.hit_points).to eq 90
    end
  end

  describe "#dead?" do
    it 'returns true if the player dies' do
      10.times { joel.attack(chloe) }
      expect(chloe.dead?).to eq true
    end
  end
end
