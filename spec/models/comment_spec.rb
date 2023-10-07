require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'najib', posts_counter: 0)
  post = Post.new(title: 'man', comments_counter: 0, likes_counter: 0)
  it 'is vlaid with a user and a post' do
    cm = Comment.new(user:, post:)
    expect(cm).to be_valid
  end

  it 'is invalid without user' do
    cm = Comment.new(post:)
    expect(cm).to be_invalid
  end

  it 'the comment sould not be present' do
    Comment.new(user:, post:)
    fountp = Post.find_by(id: post.id)
    expect(fountp).to_not be_present
  end
  #test for comments_counter_method
   it 'updates comments_counter when a comment is created' do
    user = User.create(name: 'najib')
    post = user.posts.create(title: 'My Post', comments_counter: 0, likes_counter: 0)
    expect(post.comments_counter).to eq(0)

    comment = post.comments.create(user: user, text: 'Nice post!')
    post.reload

    expect(comment).to be_valid
    expect(post.comments_counter).to eq(1)
  end
end
