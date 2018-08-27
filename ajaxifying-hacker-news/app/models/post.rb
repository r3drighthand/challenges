class Post < ApplicationRecord
  has_many :votes
  validates :title, presence: true

  def points
    votes.sum(:value)
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
