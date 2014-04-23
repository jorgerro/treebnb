class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      # t.integer :event_id, null: false
      t.integer :user_id, null: false
      t.integer :notifiable_id, null: false
      t.integer :notifiable_type, null: false

      t.timestamps
    end
  end
end
