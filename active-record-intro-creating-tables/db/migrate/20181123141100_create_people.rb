class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string   :first_name, { null: false, limit: 50 }
      t.string   :last_name, { null: false, limit: 50 }

      t.timestamps
    end
  end
end