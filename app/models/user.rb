class User < ApplicationRecord
  has_many :comments
  has_many :posts, foreign_key: :author_id
  has_many :likes
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # to use this method in rails c user = User.find(3); user.recent_posts
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
