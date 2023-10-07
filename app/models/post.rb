class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  # validation
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_then_or_equel_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_then_or_equel_to: 0 }

  # TO Use : p = Post.find(1); p.update_posts_counter
  def update_post_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
