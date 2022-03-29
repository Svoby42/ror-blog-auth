class AddIndexToTopicsTitleSlug < ActiveRecord::Migration[7.0]
  def change
    add_index :topics, :title, unique: true
    add_index :topics, :slug, unique: true
  end
end
