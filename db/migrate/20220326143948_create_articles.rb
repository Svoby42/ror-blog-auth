class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :article_content
      t.bigint :user_id
      t.timestamps
    end
    add_foreign_key :articles, :users, column: :user_id
  end
end
