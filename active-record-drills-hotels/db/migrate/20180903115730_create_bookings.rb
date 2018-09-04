class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :guest_id
      t.integer :room_id

      t.timestamps
    end
    execute("INSERT INTO sqlite_sequence (name, seq) VALUES ('bookings', 3000)")
  end
end
