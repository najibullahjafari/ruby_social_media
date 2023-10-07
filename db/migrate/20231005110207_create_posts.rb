class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.string :comments_counter
      t.string :likes_counter
      # t.integer :author_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
