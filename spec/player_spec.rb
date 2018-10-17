require 'player'

describe Player do
  let(:subject) { Player.new("Joel") }
  
  it 'should have a name' do
    expect(subject.name).to eq "Joel"
  end
end
