class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :event_id, null: false
      t.integer :user_id, null: false
      t.boolean :is_read, null: false
      t.integer :notifiable_id, null: false
      t.string  :notifiable_type, null: false

      t.timestamps
    end
    add_index :notifications, :user_id
    add_index :notifications, :event_id
  end
end
