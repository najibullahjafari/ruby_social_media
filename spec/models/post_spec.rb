require 'rails_helper'
require_relative '../factories/posts'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  describe 'Associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).is_greater_than_or_equal_to(0).only_integer }
    it { should validate_numericality_of(:likes_counter).is_greater_than_or_equal_to(0).only_integer }
  end

  describe '#update_post_counter' do
    it 'increments the author posts_counter' do
      expect { post.update_post_counter }.to change { user.reload.posts_counter }.by(1)
    end
  end

  describe '#recent_comments' do
    it 'returns the most recent comments for the post' do
      post = Posts.new

      comment1 = double('Comment', created_at: Time.now - 5)
      comment2 = double('Comment', created_at: Time.now - 4)
      comment3 = double('Comment', created_at: Time.now - 3)
      comment4 = double('Comment', created_at: Time.now - 2)
      comment5 = double('Comment', created_at: Time.now - 1)
      comment6 = double('Comment', created_at: Time.now)

      post.add_comment(comment1)
      post.add_comment(comment2)
      post.add_comment(comment3)
      post.add_comment(comment4)
      post.add_comment(comment5)
      post.add_comment(comment6)

      expect(post.recent_comments).to eq([comment6, comment5, comment4, comment3, comment2])
    end
  end
end
