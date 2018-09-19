class League < ApplicationRecord
  has_many :teams
  belongs_to :creator, class_name: "User"
end
