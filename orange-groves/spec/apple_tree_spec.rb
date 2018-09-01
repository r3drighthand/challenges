require_relative "../apple"
require_relative "../apple_tree"


describe AppleTree do
  let(:tree) { AppleTree.new }

  describe "#age" do
    it "has an age" do
      10.times {tree.pass_growing_season}
      expect(tree.age).to eq(10)
    end
  end

  describe "#height" do
    it "has a height" do
      5.times {tree.pass_growing_season}
      expect(tree.height).to eq(10)
    end
  end


  describe "#pass_growing_season" do
    it "should change the age" do
      expect {tree.pass_growing_season}.to change {tree.age}.by(1)
    end

    it "should make the tree grow" do
      expect {tree.pass_growing_season}.to change{tree.height}.by(2)
    end

    context "the tree is old enough to bear fruit" do
      it "should cause the tree to produce apples" do
        10.times {tree.pass_growing_season}
        expect(tree.has_apples?).to eq(true)
      end
    end
  end

  describe "#mature?" do
    it "returns true if tree is old enough to bear fruit" do
      5.times {tree.pass_growing_season}
      expect(tree.mature?).to eq true
    end

    it "returns false if tree is not old enough to bear fruit" do
      2.times {tree.pass_growing_season}
      expect(tree.mature?).to eq false
    end
  end

  describe "#dead?" do
    it "should return false for an alive tree" do
      44.times {tree.pass_growing_season}
      expect(tree.dead?).to eq false
    end

    it "should return true for a dead tree" do
      45.times {tree.pass_growing_season}
      expect(tree.dead?).to eq true
    end
  end

  describe '#has_apples?' do
    it 'should return true if apples are on the tree' do
      10.times {tree.pass_growing_season}
      expect(tree.has_apples?).to eq true
    end

    it "should return false if the tree has no oranges" do
      2.times {tree.pass_growing_season}
      expect(tree.has_apples?).to eq false
    end
  end

  describe "#pick_an_apple" do
    it "should return an apple from the tree" do
      10.times {tree.pass_growing_season}
      expect(tree.pick_an_apple).to be_an_instance_of(Apple)
    end

    it "the returned apple should no longer be on the tree" do
      picked_apple = tree.apples.pop
      expect(tree.apples).not_to include(picked_apple)
    end

    it "should raise an error if the tree has no apples" do
      expect {tree.pick_an_apple}.to raise_error(AppleTree::NoApplesError)
    end
  end
end
