require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'najib', posts_counter: 0)
  post = Post.new(title: 'man', comments_counter: 0, likes_counter: 0)
  it 'is vlaid with a user and a post' do
    like = Like.new(user:, post:)
    expect(like).to be_valid
  end

  it 'is invalid without user' do
    lik = Like.new(post:)
    expect(lik).to be_invalid
  end

  it 'the like sould not be present' do
    Like.new(user:, post:)
    fountp = Post.find_by(id: post.id)
    expect(fountp).to_not be_present
  end
  # method test
  it 'like counter method' do
    user = User.create(name: 'najib', posts_counter: 0)
    post = Post.create(title: 'man', comments_counter: 0, likes_counter: 0)
    Comment.create(user:, post:)
    expect(post.likes_counter).to eq('0')
  end
end
