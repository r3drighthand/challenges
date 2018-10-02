class CreateHorses < ActiveRecord::Migration[5.0]
  def change
    create_table :horses do |t|
      t.string :name
      t.string :breed

      t.timestamps
    end
  end
end
