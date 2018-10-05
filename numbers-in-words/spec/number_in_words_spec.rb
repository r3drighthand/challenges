require_relative '../number_in_words'

describe 'number_in_words' do
  it 'works for 1-20' do
    expect(number_in_words(1)).to eq 'one'
    expect(number_in_words(10)).to eq 'ten'
    expect(number_in_words(19)).to eq 'nineteen'
  end
end
