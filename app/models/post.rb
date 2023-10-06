class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def update_posts_counter # TO Use : p = Post.find(1); p.update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
