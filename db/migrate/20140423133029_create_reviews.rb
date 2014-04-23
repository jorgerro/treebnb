class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body, null: false
      t.integer :author_id, null: false
      t.integer :reviewable_id, null: false
      t.string :reviewable_type, null: false

      t.timestamps
    end
    add_index :reviews, :author_id
    add_index :reviews, :reviewable_id
  end
end
