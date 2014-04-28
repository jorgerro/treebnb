class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :room_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :availabilities, :room_id
  end
end
