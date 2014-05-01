class AddRegionToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :address_region, :string
  end
end
