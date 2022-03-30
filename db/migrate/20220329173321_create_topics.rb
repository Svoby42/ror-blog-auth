class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.string "title", null: false
      t.string "description", null: false
      t.string "slug", null: false
      t.timestamps
    end
  end
end
