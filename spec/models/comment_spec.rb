require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post).counter_cache(false) }
  end

  describe 'methods' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }

    describe '#update_comment_count' do
  it 'increments the comments_counter' do
    post = create(:post) # Use FactoryBot to create a post
    initial_comments_count = post.comments_counter

    Comment.create(user: user, post: post, text: "Sample comment")

    expect(post.reload.comments_counter).to eq(initial_comments_count + 1)
  end
end
  end
end
