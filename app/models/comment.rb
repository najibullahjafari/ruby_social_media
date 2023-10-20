class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_post_comments_counter
  after_destroy :decrement_post_comments_counter

  def increment_post_comments_counter
    post.increment!(:comments_counter)
  end

  def decrement_post_comments_counter
    post.decrement!(:comments_counter)
  end

  scope :recent, -> { order(created_at: :desc).limit(5) }

  validates :content, presence: true
end
