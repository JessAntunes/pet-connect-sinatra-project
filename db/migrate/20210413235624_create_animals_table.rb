class CreateAnimalsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :gender
      t.string :age
      t.string :temperment
      t.boolean :kid_friendly
      t.boolean :pet_friendly
      t.integer :shelter_id
      t.date  :added
    end
  end
end
