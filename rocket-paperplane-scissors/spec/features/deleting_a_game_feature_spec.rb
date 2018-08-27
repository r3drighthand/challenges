require "rails_helper"

feature "deleting a game" do
  scenario "the user visits homepage and deletes a recent game" do

    most_recent_game = Game.create!(user_throw: "paper")

    visit "/"

    within(".recent-games") do
      expect(page).to have_content most_recent_game.user_throw
      click_link("Destroy")
    end

    expect(page).not_to have_content most_recent_game.user_throw

    expect(page).to have_current_path games_path
  end
end
