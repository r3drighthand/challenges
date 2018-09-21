require_relative '../prime_factors'

describe 'prime_factors' do
  it 'returns empty if the number is prime' do
    expect(prime_factors(7)).to eq [7]
  end

  it 'finds prime factors of 6' do
    expect(prime_factors(6)).to eq [2, 3]
  end

  it 'finds prime factors of 8' do
    expect(prime_factors(8)).to eq [2, 2, 2]
  end

  it 'finds prime factors of 12' do
    expect(prime_factors(12)).to eq [2, 2, 3]
  end

  it 'finds prime factors of 38' do
    expect(prime_factors(38)).to eq [2, 19]
  end

  it 'finds prime factors of 123123123' do
    expect(prime_factors(123123123)).to eq [3, 3, 41, 333667]
  end
end