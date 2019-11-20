class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.date :birthdate
      t.string :breed
      t.references :kind, foreign_key: true

      t.timestamps
    end
  end
end
