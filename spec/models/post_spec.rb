require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  describe 'Associations' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).is_greater_than_or_equal_to(0).only_integer }
    it { should validate_numericality_of(:likes_counter).is_greater_than_or_equal_to(0).only_integer }
  end

  describe '#recent_comments' do
    it 'returns the most recent comments for the post' do
      comment1 = Comment.create(user: user, post: post, created_at: Time.now - 5.days)
      comment2 = Comment.create(user: user, post: post, created_at: Time.now - 4.days)
      comment3 = Comment.create(user: user, post: post, created_at: Time.now - 3.days)
      comment4 = Comment.create(user: user, post: post, created_at: Time.now - 2.days)
      comment5 = Comment.create(user: user, post: post, created_at: Time.now - 1.day)
      comment6 = Comment.create(user: user, post: post, created_at: Time.now)

      expect(post.recent_comments).to eq([comment6, comment5, comment4, comment3, comment2])
    end
  end
end
