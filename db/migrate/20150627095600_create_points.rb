class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :star

      t.timestamps null: false
    end
  end
end
