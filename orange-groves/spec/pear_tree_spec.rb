require_relative "../pear"
require_relative "../pear_tree"


describe PearTree do
  let(:tree) { PearTree.new }

  describe "#age" do
    it "has an age" do
      10.times {tree.pass_growing_season}
      expect(tree.age).to eq(10)
    end
  end

  describe "#height" do
    it "has a height" do
      2.times {tree.pass_growing_season}
      expect(tree.height).to eq(5)
    end
  end


  describe "#pass_growing_season" do
    it "should change the age" do
      expect {tree.pass_growing_season}.to change {tree.age}.by(1)
    end

    it "should make the tree grow" do
      expect {tree.pass_growing_season}.to change{tree.height}.by(2.5)
    end

    context "the tree is old enough to bear fruit" do
      it "should cause the tree to produce pears" do
        10.times {tree.pass_growing_season}
        expect(tree.has_pears?).to eq(true)
      end
    end
  end

  describe "#mature?" do
    it "returns true if tree is old enough to bear fruit" do
      5.times {tree.pass_growing_season}
      expect(tree.mature?).to eq true
    end

    it "returns false if tree is not old enough to bear fruit" do
      4.times {tree.pass_growing_season}
      expect(tree.mature?).to eq false
    end
  end

  describe "#dead?" do
    it "should return false for an alive tree" do
      39.times {tree.pass_growing_season}
      expect(tree.dead?).to eq false
    end

    it "should return true for a dead tree" do
      40.times {tree.pass_growing_season}
      expect(tree.dead?).to eq true
    end
  end

  describe '#has_pears?' do
    it 'should return true if pears are on the tree' do
      10.times {tree.pass_growing_season}
      expect(tree.has_pears?).to eq true
    end

    it "should return false if the tree has no pears" do
      4.times {tree.pass_growing_season}
      expect(tree.has_pears?).to eq false
    end
  end

  describe "#pick_a_pear" do
    it "should return an pear from the tree" do
      10.times {tree.pass_growing_season}
      expect(tree.pick_a_pear).to be_an_instance_of(Pear)
    end

    it "the returned pear should no longer be on the tree" do
      picked_pear = tree.pears.pop
      expect(tree.pears).not_to include(picked_pear)
    end

    it "should raise an error if the tree has no pears" do
      expect {tree.pick_a_pear}.to raise_error(PearTree::NoPearsError)
    end
  end
end
