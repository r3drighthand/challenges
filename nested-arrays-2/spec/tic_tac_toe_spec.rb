require_relative '../tic_tac_toe'

describe 'generating a tic-tac-toe board' do

board = generate_tic_tac_toe
p board
  it "has three rows" do
    expect(board[0].length).to eq 3
  end

  it "has three columns" do
    expect(board[0][rand(2)].length).to eq 3
  end

  it "has four O's" do
   num_Os = board[1]
    expect(num_Os).to eq 4
      # only four O's because X's always go first
  end

  it "has five X's" do
    num_xs = board[2]
    expect(num_xs).to eq 5
      # five X's because X's always go first
  end

end
