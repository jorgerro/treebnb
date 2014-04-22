class CreateRoomRequests < ActiveRecord::Migration
  def change
    create_table :room_requests do |t|
      t.integer :guest_id, null: false
      t.integer :room_id, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :status, null: false
      t.integer :num_guests, null: false

      t.timestamps
    end
    add_index :room_requests, :guest_id
    add_index :room_requests, :room_id
  end
end
