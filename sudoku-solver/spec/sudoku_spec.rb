require_relative '../sudoku'

describe "Sudoku board 1" do

   let(:strings) { [
    '1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--',
    '--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3'] }

  board_1_string = '1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--'

  board_as_array = ['covfefe',1, 0, 5, 8, 0, 2, 0, 0, 0, 0, 9, 0, 0, 7, 6, 4, 0, 5, 2, 0, 0, 4, 0, 0, 8, 1, 9, 0, 1, 9, 0, 0, 7, 3, 0, 6, 7, 6, 2, 0, 8, 3, 0, 9, 0, 0, 0, 0, 0, 6, 1, 0, 5, 0, 0, 0, 7, 6, 0, 0, 0, 3, 0, 4, 3, 0, 0, 2, 0, 5, 0, 1, 6, 0, 0, 3, 0, 8, 9, 0, 0]

  rows = [[1, 0, 5, 8, 0, 2, 0, 0, 0], [0, 9, 0, 0, 7, 6, 4, 0, 5], [2, 0, 0, 4, 0, 0, 8, 1, 9], [0, 1, 9, 0, 0, 7, 3, 0, 6], [7, 6, 2, 0, 8, 3, 0, 9, 0], [0, 0, 0, 0, 6, 1, 0, 5, 0], [0, 0, 7, 6, 0, 0, 0, 3, 0], [4, 3, 0, 0, 2, 0, 5, 0, 1], [6, 0, 0, 3, 0, 8, 9, 0, 0]]

  columns = [[1,0,2,0,7,0,0,4,6], [0,9,0,1,6,0,0,3,0],[5,0,0,9,2,0,7,0,0],[8,0,4,0,0,0,6,0,3],[0,7,0,0,8,6,0,2,0],[2,6,0,7,3,1,0,0,8],[0,4,8,3,0,0,0,5,9],[0,0,1,0,9,5,3,0,0],[0,5,9,6,0,0,0,1,0]]

  boxes = [[1,0,5,0,9,0,2,0,0], [8,0,2,0,7,6,4,0,0],[0,0,0,4,0,5,8,1,9],[0,1,9,7,6,2,0,0,0], [0,0,7,0,8,3,0,6,1], [3,0,6,0,9,0,0,5,0], [0,0,7,4,3,0,6,0,0],[6,0,0,0,2,0,3,0,8],[0,3,0,5,0,1,9,0,0]]

  it 'splits board into 9 rows' do
    expect(split_rows(board_as_array)).to match rows
  end

  it 'splits board into 9 columns' do
    expect(split_columns(rows)).to match columns
  end

  it 'splits board into 9 boxes' do
    expect(split_boxes(board_as_array)).to match boxes
  end

  it 'identifies row of a given cell' do
    expect(id_cell_row(23)).to eq 3
  end

  it 'identifies column of a given cell' do
    expect(id_cell_col(57)).to eq 3
  end

  it 'identifies row of a given cell' do
    expect(id_cell_row(81)).to eq 9
  end

  it 'identifies box of a given cell' do
    expect(id_cell_box(4,5)).to eq 5
  end

  it 'calls row of given cell' do
    expect(get_cell_row(rows,1)).to eq [1, 0, 5, 8, 0, 2, 0, 0, 0]
  end

  it 'calls column of a given cell' do
    expect(get_cell_col(columns,1)).to eq [1,0,2,0,7,0,0,4,6]
  end

  it 'calls box of a given cell' do
    expect(get_cell_box(boxes,1)).to eq [1,0,5,0,9,0,2,0,0]
  end

  it 'Turns string into array where dashes are 0s' do
      expect(process_string(strings[0])).to eq([1, 0, 5, 8, 0, 2, 0, 0, 0, 0, 9, 0, 0, 7, 6, 4, 0, 5, 2, 0, 0, 4, 0, 0, 8, 1, 9, 0, 1, 9, 0, 0, 7, 3, 0, 6, 7, 6, 2, 0, 8, 3, 0, 9, 0, 0, 0, 0, 0, 6, 1, 0, 5, 0, 0, 0, 7, 6, 0, 0, 0, 3, 0, 4, 3, 0, 0, 2, 0, 5, 0, 1, 6, 0, 0, 3, 0, 8, 9, 0, 0])
  end

  it 'Turns string into array where fakearrays are arrays' do
      expect(process_string('1[13567]58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--')).to eq([1, [1,3,5,6,7], 5, 8, 0, 2, 0, 0, 0, 0, 9, 0, 0, 7, 6, 4, 0, 5, 2, 0, 0, 4, 0, 0, 8, 1, 9, 0, 1, 9, 0, 0, 7, 3, 0, 6, 7, 6, 2, 0, 8, 3, 0, 9, 0, 0, 0, 0, 0, 6, 1, 0, 5, 0, 0, 0, 7, 6, 0, 0, 0, 3, 0, 4, 3, 0, 0, 2, 0, 5, 0, 1, 6, 0, 0, 3, 0, 8, 9, 0, 0])
  end

  it 'Turns array into string where 0s are dashes' do
    expect(prepare_string([1, 0, 5, 8, 0, 2, 0, 0, 0, 0, 9, 0, 0, 7, 6, 4, 0, 5, 2, 0, 0, 4, 0, 0, 8, 1, 9, 0, 1, 9, 0, 0, 7, 3, 0, 6, 7, 6, 2, 0, 8, 3, 0, 9, 0, 0, 0, 0, 0, 6, 1, 0, 5, 0, 0, 0, 7, 6, 0, 0, 0, 3, 0, 4, 3, 0, 0, 2, 0, 5, 0, 1, 6, 0, 0, 3, 0, 8, 9, 0, 0])).to eq(strings[0])
  end

  it 'Turns array into string where array present' do
    expect(prepare_string([1, [1,3,5,6,7], 5, 8, 0, 2, 0, 0, 0, 0, 9, 0, 0, 7, 6, 4, 0, 5, 2, 0, 0, 4, 0, 0, 8, 1, 9, 0, 1, 9, 0, 0, 7, 3, 0, 6, 7, 6, 2, 0, 8, 3, 0, 9, 0, 0, 0, 0, 0, 6, 1, 0, 5, 0, 0, 0, 7, 6, 0, 0, 0, 3, 0, 4, 3, 0, 0, 2, 0, 5, 0, 1, 6, 0, 0, 3, 0, 8, 9, 0, 0])).to eq('1[13567]58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--')
  end

  it 'calls solve' do
    expect(solve(board_1_string)).to eq [4,7]
  end
end
