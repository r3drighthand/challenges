require_relative "../orange"
require_relative "../orange_tree"


describe OrangeTree do
  let(:tree) { OrangeTree.new }

  describe "#age" do
    it "has an age" do
      10.times {tree.pass_growing_season}
      expect(tree.age).to eq(10)
    end
  end

  describe "#height" do
    it "has a height" do
      5.times {tree.pass_growing_season}
      expect(tree.height).to eq(12.5)
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
      it "should cause the tree to produce oranges" do
        10.times {tree.pass_growing_season}
        expect(tree.has_oranges?).to eq(true)
      end
    end
  end

  describe "#mature?" do
    it "returns true if tree is old enough to bear fruit" do
      6.times {tree.pass_growing_season}
      expect(tree.mature?).to eq true
    end

    it "returns false if tree is not old enough to bear fruit" do
      4.times {tree.pass_growing_season}
      expect(tree.mature?).to eq false
    end
  end

  describe "#dead?" do
    it "should return false for an alive tree" do
      99.times {tree.pass_growing_season}
      expect(tree.dead?).to eq false
    end

    it "should return true for a dead tree" do
      100.times {tree.pass_growing_season}
      expect(tree.dead?).to eq true
    end
  end

  describe '#has_oranges?' do
    it 'should return true if oranges are on the tree' do
      10.times {tree.pass_growing_season}
      expect(tree.has_oranges?).to eq true
    end

    it "should return false if the tree has no oranges" do
      4.times {tree.pass_growing_season}
      expect(tree.has_oranges?).to eq false
    end
  end

  describe "#pick_an_orange" do
    it "should return an orange from the tree" do
      10.times {tree.pass_growing_season}
      expect(tree.pick_an_orange).to be_an_instance_of(Orange)
    end

    it "the returned orange should no longer be on the tree" do
      picked_orange = tree.oranges.pop
      expect(tree.oranges).not_to include(picked_orange)
    end

    it "should raise an error if the tree has no oranges" do
      expect {tree.pick_an_orange}.to raise_error(OrangeTree::NoOrangesError)
    end
  end
end
