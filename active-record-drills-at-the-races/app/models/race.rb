class Race < ApplicationRecord
  has_many :jockeys, through: :entries
  has_many :entries
  has_many :horses, through: :entries
end
