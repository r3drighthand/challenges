require 'rails_helper'

describe Game do
  let(:game) { Game.new }

  describe ".recent" do
    it "returns the five most recent games" do
      game_one = Game.create!(user_throw: 'rock')
      game_two = Game.create!(user_throw: 'rock')
      game_three = Game.create!(user_throw: 'rock')
      game_four = Game.create!(user_throw: 'rock')
      game_five = Game.create!(user_throw: 'rock')
      game_six = Game.create!(user_throw: 'rock')
      expect(Game.recent).to eq([game_six, game_five, game_four, game_three, game_two])
    end
  end

  describe "#throw_for_computer" do
    context "when the game already has a computer throw" do
      it "returns the computer throw" do
        game.computer_throw = "paper"
        expect(game.throw_for_computer).to eq "paper"
      end
    end

    context "when the game does not have a computer throw" do
      it "generates a throw" do
        expect(game.throw_for_computer).to be_in Game::THROWS
      end

      it "sets the computer throw to the generated throw" do
        expect(game.computer_throw).to be_nil
        generated_computer_throw = game.throw_for_computer
        expect(game.computer_throw).to eq generated_computer_throw
      end
    end
  end

  describe "#computer_throw" do
    describe "validations" do
      it "is valid when it's rock" do
        game.computer_throw = 'rock'
        game.valid?
        expect(game.errors[:computer_throw]).to be_empty
      end

      it "is valid when it's paper" do
        game.computer_throw = 'paper'
        game.valid?
        expect(game.errors[:computer_throw]).to be_empty
      end

      it "is valid when it's scissors" do
        game.computer_throw = 'scissors'
        game.valid?
        expect(game.errors[:computer_throw]).to be_empty
      end

      it "is NOT valid when it's pineapple" do
        game.computer_throw = 'pineapple'
        game.valid?
        expect(game.errors[:computer_throw]).to_not be_empty
      end
    end
  end

  describe "#user_throw" do
    describe "validations" do
      it "is valid when it's rock" do
        game.user_throw = 'rock'
        game.valid?
        expect(game.errors[:user_throw]).to be_empty
      end

      it "is valid when it's paper" do
        game.user_throw = 'paper'
        game.valid?
        expect(game.errors[:user_throw]).to be_empty
      end

      it "is valid when it's scissors" do
        game.user_throw = 'scissors'
        game.valid?
        expect(game.errors[:user_throw]).to be_empty
      end

      it "is NOT valid when it's avocado" do
        game.user_throw = 'avocado'
        game.valid?
        expect(game.errors[:user_throw]).to_not be_empty
      end
    end
  end

  describe "#winner" do
    it "computer is the winner when the computer throw beats the user throw" do
      game.user_throw = "scissors"
      game.computer_throw = "rock"

      expect(game.winner).to eq "computer"
    end

    it "user is the winner when the user throw beats the computer throw" do
      game.user_throw = "scissors"
      game.computer_throw = "paper"

      expect(game.winner).to eq "user"
    end
  end

  describe "#winner_throw" do
    it "returns the user throw when the user wins" do
      game.user_throw = "paper"
      game.computer_throw = "rock"

      expect(game.winner_throw).to eq game.user_throw
    end

    it "returns the computer throw when the computer wins" do
      game.user_throw = "rock"
      game.computer_throw = "paper"

      expect(game.winner_throw).to eq game.computer_throw
    end
  end

  describe "#loser_throw" do
    it "returns the user throw when the computer wins" do
      game.user_throw = "rock"
      game.computer_throw = "paper"

      expect(game.loser_throw).to eq game.user_throw
    end

    it "returns the computer throw when the user wins" do
      game.user_throw = "paper"
      game.computer_throw = "rock"

      expect(game.loser_throw).to eq game.computer_throw
    end
  end

  describe "#user_won?" do
    it "returns false when the user loses" do
      game.user_throw = "rock"
      game.computer_throw = "paper"

      expect(game.user_won?).to be false
    end

    it "returns true when the user wins" do
      game.user_throw = "paper"
      game.computer_throw = "rock"

      expect(game.user_won?).to be true
    end

    it "returns true when the user wins" do
      game.user_throw = "scissors"
      game.computer_throw = "paper"

      expect(game.user_won?).to be true
    end

    it "returns true when the user wins" do
      game.user_throw = "rock"
      game.computer_throw = "scissors"

      expect(game.user_won?).to be true
    end
  end

  describe "#tie?" do
    it "returns true when there is a tie" do
      game.user_throw = "rock"
      game.computer_throw = "rock"

      expect(game.tie?).to be true
    end
  end

end
