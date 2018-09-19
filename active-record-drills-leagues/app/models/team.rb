class Team < ApplicationRecord
  belongs_to :league
  belongs_to :captain, class_name: "User"
  has_many :players_teams
  has_many :members, through: :players_teams, source: :user
end
