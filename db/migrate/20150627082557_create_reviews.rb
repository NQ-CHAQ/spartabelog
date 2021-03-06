class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true
      t.integer :point
      t.text :body

      t.timestamps null: false
    end
  add_index :reviews, [:restaurant_id, :user_id], unique: true
  end
end
