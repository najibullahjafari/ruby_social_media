require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'John', posts_counter: 0) }

  it 'is valid with a title, comments_counter, and likes_counter' do
    post = user.posts.new(title: 'Example Post', comments_counter: 0, likes_counter: 0)
    expect(post).to be_valid
  end

  it 'is invalid without a title' do
    post = user.posts.new(comments_counter: 0, likes_counter: 0)
    expect(post).to_not be_valid
  end

  it 'is invalid with a title exceeding 250 characters' do
    long_title = 'a' * 251
    post = user.posts.new(title: long_title, comments_counter: 0, likes_counter: 0)
    expect(post).to_not be_valid
  end

  it 'updates the posts_counter for the author' do
    post = user.posts.create(title: 'Example Post', comments_counter: 0, likes_counter: 0)
    expect { post.update_post_counter }.to change { user.reload.posts_counter }.by(1)
  end
  # method tests
  it 'should test update_user_counter' do
    user = User.new(name: 'najib', posts_counter: 0)
    post = Post.create(title: 'Example Post', author: user)
    expect(user.posts_counter).to eq(0)
    post.update_post_counter
    expect(user.posts_counter).to eq(1)
  end

  it 'should test recent comments  method' do
    user = User.new(name: 'najib', posts_counter: 0)
    post = Post.create(title: 'Example Post', author: user)
    comments = []
    recent_comments = post.recent_comments
    expect(recent_comments).to eq(comments.reverse)
    expect(recent_comments.count).to eq(0)
  end
end
