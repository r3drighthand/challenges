class AddUniqueIndexToReviews < ActiveRecord::Migration
  def change
    add_index :reviews, [:reviewer_id, :restaurant_id], unique: true
  end
end
