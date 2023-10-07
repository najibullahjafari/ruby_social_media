require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with a name and posts_counter >= 0' do
      user = User.new(name: 'Masuma', posts_counter: 5)
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(posts_counter: 3)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is invalid if posts_counter is not an integer' do
      user = User.new(name: 'Jaffery', posts_counter: 'invalid')
      user.valid? # Ensure validations are run
      expect(user.errors[:posts_counter]).to include('is not a number')
    end

    it 'is invalid if posts_counter is less than 0' do
      user = User.new(name: 'Bob', posts_counter: -1)
      expect(user).not_to be_valid
      expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
    end
  end

  describe '#recent_posts' do
    it 'returns the most recent posts of the user' do
      user = create(:user)
      post1 = create(:post, author: user, title: 'Post 1')
      post2 = create(:post, author: user, title: 'Post 2')

      recent_posts = user.recent_posts(1)

      expect(recent_posts).to include(post2)
      expect(recent_posts).not_to include(post1)
    end

    it 'returns up to the specified limit of recent posts' do
      user = create(:user)
      post1 = create(:post, author: user, title: 'Post 1')
      post2 = create(:post, author: user, title: 'Post 2')
      post3 = create(:post, author: user, title: 'Post 3')

      recent_posts = user.recent_posts(2)

      expect(recent_posts.length).to eq(2)
      expect(recent_posts).to include(post3, post2)
      expect(recent_posts).not_to include(post1)
    end
  end
end
