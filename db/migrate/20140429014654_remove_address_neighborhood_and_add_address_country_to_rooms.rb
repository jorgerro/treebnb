class RemoveAddressNeighborhoodAndAddAddressCountryToRooms < ActiveRecord::Migration
  def change
    remove_column :rooms, :address_neighborhood, :string
    add_column :rooms, :address_country, :string
  end
end
