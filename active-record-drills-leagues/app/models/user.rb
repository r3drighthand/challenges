class User < ApplicationRecord
  has_one :created_league, class_name: "League", foreign_key: "creator_id"
  has_one :captain_position, class_name: "Team", foreign_key: "captain_id"
  has_many :players_teams
  has_many :joined_teams, through: :players_teams, source: :team
end
