require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'najib', posts_counter: 0)
  post = Post.new(title: 'man', comments_counter: 0, likes_counter: 0)
  it "is vlaid with a user and a post" do
    like = Like.new(user: user, post: post)
    expect(like).to be_valid
  end

  it "is invalid without user" do
    lik = Like.new(post: post)
    expect(lik).to be_invalid
  end

  it "the like sould not be present" do
    like = Like.new(user: user, post: post)
    fountp = Post.find_by(id: post.id)
    expect(fountp).to_not be_present
  end
end
