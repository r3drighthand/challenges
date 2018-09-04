class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :rate
      t.integer :number
      t.integer :hotel_id

      t.timestamps
    end

    execute("INSERT INTO sqlite_sequence (name, seq) VALUES ('rooms', 4000)")
  end
end
