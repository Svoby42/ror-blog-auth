class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :article_content
      t.bigint :user_id
      t.bigint :topic_id
      t.timestamps
    end
  end
end
