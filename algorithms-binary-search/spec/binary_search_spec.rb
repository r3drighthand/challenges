require_relative '../binary_search'

describe 'binary_search' do
  it 'can search through an array of even-numbered objects' do
    array = [1,2,3,4,5,6,7,8]
    expect(binary_search(array,2)).to eq 1
  end

  it 'can search through an array of odd-numbered objects' do
    array = [1,2,3,4,5,6,7]
    expect(binary_search(array,6)).to eq 5
  end

  it 'returns nil if the target is not found' do
    array = [1,2,3,4,5]
    expect(binary_search(array,6)).to eq nil
  end
end
