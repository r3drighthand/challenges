class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :content, null: false
      t.integer :reviewer_id, null: false, foreign_key: true
      t.integer :restaurant_id, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
