class LeaguesTable < ActiveRecord::Migration[5.0]
  def change
      create_table :leagues do |t|
      t.string  :name
      t.string  :day
      t.integer :creator_id

      t.timestamps
    end
  end
end
