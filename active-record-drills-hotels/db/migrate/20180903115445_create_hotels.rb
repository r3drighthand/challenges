class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :name

      t.timestamps
    end
    execute("INSERT INTO sqlite_sequence (name, seq) VALUES ('hotels', 1000)")
  end
end
