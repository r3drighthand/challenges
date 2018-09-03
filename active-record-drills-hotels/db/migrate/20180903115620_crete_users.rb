class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end
    execute("INSERT INTO sqlite_sequence (name, seq) VALUES ('users', 2000)")
  end
end
