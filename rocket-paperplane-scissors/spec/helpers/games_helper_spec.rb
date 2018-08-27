require 'rails_helper'

describe GamesHelper do
  describe "#headline" do
    it "states that the user won when the user won the game" do
      game = Game.new(user_throw: "paper", computer_throw: "rock")

      expect(helper.headline(game)).to eq "User Won!!!"
    end

    it "states that the user lost when the computer won the game" do
      game = Game.new(user_throw: "paper", computer_throw: "scissors")

      expect(helper.headline(game)).to eq "User Lost"
    end
  end

  describe "#result_for_user_throw" do
    context "when the user won the game" do
      it "returns 'covers' when the user threw paper" do
        game = Game.new(user_throw: "paper", computer_throw: "rock")
        expect(helper.result_for_user_throw(game)).to eq("covers")
      end
      it "returns 'cut' when the user threw scissors" do
        game = Game.new(user_throw: "scissors", computer_throw: "paper")
        expect(helper.result_for_user_throw(game)).to eq("cut")
      end
      it "returns 'crushes' when the user threw rock" do
        game = Game.new(user_throw: "rock", computer_throw: "scissors")
        expect(helper.result_for_user_throw(game)).to eq("crushes")
      end
    end

    context "when the computer won the game" do
      it "returns 'is cut by' when the user threw paper" do
        game = Game.new(user_throw: "paper", computer_throw: "scissors")
        expect(helper.result_for_user_throw(game)).to eq("is cut by")
      end
      it "returns 'is crushed by' when the user threw scissors" do
        game = Game.new(user_throw: "scissors", computer_throw: "rock")
        expect(helper.result_for_user_throw(game)).to eq("is crushed by")
      end
      it "returns 'is covered by' when the user threw rock" do
        game = Game.new(user_throw: "rock", computer_throw: "paper")
        expect(helper.result_for_user_throw(game)).to eq("is covered by")
      end
    end
  end

  describe "#throw_color" do
    it "returns 'success' when the throw is paper" do
      throw = "paper"
      expect(helper.throw_color(throw)).to eq("success")
    end
    it "returns 'info' when the throw is scissors" do
      throw = "scissors"
      expect(helper.throw_color(throw)).to eq("info")
    end
    it "returns 'danger' when the throw is rock" do
      throw = "rock"
      expect(helper.throw_color(throw)).to eq("danger")
    end
  end

  describe "#throw_fa_icon" do
    it "returns 'fa-hand-stop-o' when the throw is paper" do
      throw = "paper"
      expect(helper.throw_fa_icon(throw)).to eq("fa-hand-stop-o")
    end
    it "returns 'fa-hand-scissors-o' when the throw is scissors" do
      throw = "scissors"
      expect(helper.throw_fa_icon(throw)).to eq("fa-hand-scissors-o")
    end
    it "returns 'fa-hand-rock-o' when the throw is rock" do
      throw = "rock"
      expect(helper.throw_fa_icon(throw)).to eq("fa-hand-rock-o")
    end
  end

end
