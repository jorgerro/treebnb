class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :room_id, null: false

      t.timestamps
    end
    add_attachment :pictures, :image
  end
end
