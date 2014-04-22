class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :owner_id, null: false
      t.string :home_type, null: false
      t.string :room_type, null: false
      t.string :address_city, null: false
      t.integer :num_possible_guests, null: false
      t.string :title
      t.text :description
      t.integer :price_per_night
      t.integer :num_bedrooms
      t.integer :num_bathrooms
      t.string :address_neighborhood
      t.string :street_address
      t.string :address_zip_code

      t.timestamps
    end
    add_index :rooms, :owner_id
  end
end
