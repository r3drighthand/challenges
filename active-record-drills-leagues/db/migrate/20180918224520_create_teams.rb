class Teams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string  :name
      t.string  :uniform_color
      t.integer :league_id
      t.integer :captain_id
    end
  end
end