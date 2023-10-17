require 'rails_helper'

RSpec.describe 'Post show', type: :system do
  describe 'show page' do

    let!(:user) { User.create(name: "Naji", photo_url: "https://example.com/alice.jpg", bio:"my bio") }
    let!(:post) { user.posts.create(title: "Hello", text: "This is my first post") }
    let!(:comment1) { Comment.create(user: user, post:post, text: "This is my first comment") }
    let!(:comment2) { Comment.create(user: user, post:post, text: "This is my second comment") }
    let!(:like1) { post.likes.create(user: user) }
    let!(:like2) { post.likes.create(user: user) }

    it 'shows the content' do
        # Visit the post show page
        visit user_post_path(user, post)
        expect(page).to have_content('Hello')
    end
  end
end