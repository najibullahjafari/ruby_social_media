class User < ApplicationRecord
  # Callbacks
  before_create :set_default_role
  # Associations
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # Validations
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :role, inclusion: { in: %w[user admin], message: '%<value>s is not a valid role' }
  # Methods
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def admin?
    'admin'
  end

  private

  def set_default_role
    self.role ||= 'user'
  end
end
