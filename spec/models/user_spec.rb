require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#recent_posts' do
    user = User.new(name: 'najib', posts_counter: 3)

    it 'return if post is valid' do
      expect(user).to be_valid
    end

    it 'it should test if the user is invalid ' do
      user = User.new(name: nil, posts_counter: 3)
      expect(user).to_not be_valid
    end

    it 'should test that user have recent posts' do
      user = User.new(name: 'najib', posts_counter: 4)
      expect(user.posts_counter).to be_equal(4)
    end
    # method test
    it 'should test update_user_counter' do
      user = User.new(name: 'najib', posts_counter: 0)
      post = Post.create(title: 'Example Post', author: user)
      expect(user.posts_counter).to eq(0)
      post.update_post_counter
      expect(user.posts_counter).to eq(1)
    end
  end
end
