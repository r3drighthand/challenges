class Review < ActiveRecord::Base
  validates :reviewer_id, uniqueness: { scope: :restaurant_id }
  belongs_to :reviewer, class_name: "User"
  belongs_to :restaurant
end
