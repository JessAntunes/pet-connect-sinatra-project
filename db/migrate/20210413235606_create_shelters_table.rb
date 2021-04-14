class CreateSheltersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :shelters do |t|
      t.string :email
      t.string :password_digest
      t.string :shelter_name
      t.string :hours
      t.string :phone
      t.string :location
    end
  end
end
