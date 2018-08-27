require "rails_helper"

feature "playing a game" do
  context "when user wins the game" do
    scenario "the user selects a winning throw and is shown the game's result" do
      # stub the computer throw
      allow_any_instance_of(Game).to receive(:computer_throw).and_return("paper")

      visit '/games/new'

      # user chooses winning throw
      click_button("throw-scissors")

      most_recent_game = Game.last
      # user sees that the user won and the result for the user throw
      expect(page).to have_current_path game_path(most_recent_game)
      expect(page).to have_content 'User Won!!!'
    end
  end

  context "when user loses the game" do
    scenario "the user selects a losing throw and is shown the game's result" do
      # stub the computer throw
      allow_any_instance_of(Game).to receive(:computer_throw).and_return("paper")

      visit '/games/new'

      # user chooses losing throw
      click_button("throw-rock")

      most_recent_game = Game.last
      # user sees that the user lost and the result for the user throw
      expect(page).to have_current_path game_path(most_recent_game)
      expect(page).to have_content 'User Lost'
      expect(page).to have_content 'is covered by'
    end
  end

  context "when the game is a tie" do
    scenario "the user selects a throw and is shown the game's result" do
      # stub the computer throw
      allow_any_instance_of(Game).to receive(:computer_throw).and_return("paper")

      visit '/games/new'

      # user chooses the same throw as the computer
      click_button("throw-paper")

      most_recent_game = Game.last
      # user sees that the game is a tie and the buttons to choose another throw
      expect(page).to have_current_path games_path
      expect(page).to have_content 'Tie Game!'
    end
  end
end
