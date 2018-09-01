require_relative '../roman_numerals'

describe 'converting an Arabic number to a Roman numeral' do
  describe 'old Roman numerals' do
    it 'converts 1 to I' do
      expect(convert_to_roman(1)).to eq "I"
    end

    it 'converts 4 to IIII' do
      expect(convert_to_roman(4)).to eq "IIII"
    end

    it 'converts 11 to XI' do
      expect(convert_to_roman(11)).to eq "XI"
    end

    it 'converts 34 to XXXIIII' do
      expect(convert_to_roman(34)).to eq "XXXIIII"
    end

    it 'converts 29 to XXVIIII' do
      expect(convert_to_roman(29)).to eq "XXVIIII"
    end
  end

  end

  describe 'modern Roman numerals' do
    it 'converts 4 to IV' do
      expect(convert_to_roman(4, true)).to eq "IV"
    end

    it 'converts 9 to IX' do
      expect(convert_to_roman(9, true)).to eq "IX"
    end

    it 'converts 259 to CCLIX' do
      expect(convert_to_roman(259, true)).to eq "CCLIX"
    end
  end
end
