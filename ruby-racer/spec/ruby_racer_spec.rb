require_relative '../die'
require_relative '../ruby_racer'

describe RubyRacer do
  let(:die) { Die.new }
  let(:game) { RubyRacer.new(['a', 'b'], die, 30) }

  it 'has 2 players' do
    expect(game.players).to eq(['a', 'b'])
  end

  it 'has a die' do
    expect(game.die).to eq(die)
  end

  it 'has a determined board length' do
    expect(game.length).to eq(30)
  end

  it 'returns the game winner' do
    game.player2_location += 30
    expect(game.winner).to eq('b')
  end

  it 'returns nil if no players have reached the end' do
    game.player1_location += 5
    game.player2_location += 6
    expect(game.winner).to eq nil
  end

end
