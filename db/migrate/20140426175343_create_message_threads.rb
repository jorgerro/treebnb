class CreateMessageThreads < ActiveRecord::Migration
  def change
    create_table :message_threads do |t|
      t.integer :user_one_id, null: false
      t.integer :user_two_id, null: false

      t.timestamps
    end

    add_index :message_threads, :user_one_id
    add_index :message_threads, :user_two_id
    add_index :message_threads, [:user_one_id, :user_two_id], unique: true
  end
end
