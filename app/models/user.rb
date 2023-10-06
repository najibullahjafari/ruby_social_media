class User < ApplicationRecord
  has_many :comments
  has_many :posts, foreign_key: :author_id
  has_many :likes

  def recent_posts #to use this method in rails c user = User.find(3); user.recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
