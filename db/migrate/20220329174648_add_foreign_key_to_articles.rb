class AddForeignKeyToArticles < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :articles, :users, column: :user_id
    add_foreign_key :articles, :topics, column: :topic_id
  end
end
