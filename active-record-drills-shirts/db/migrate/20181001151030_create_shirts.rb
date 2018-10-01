class CreateShirts < ActiveRecord::Migration[5.0]
  def change
    create_table :shirts do |t|
      t.integer :designer_id

      t.timestamps
    end
  end
end
