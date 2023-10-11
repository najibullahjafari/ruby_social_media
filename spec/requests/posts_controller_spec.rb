require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create!( name: 'Test User', bio: 'Test bio.') }

  describe 'GET /index' do
    it 'renders the index template' do
      get user_posts_path(user.id)
      expect(response).to render_template(:index)
    end

    it 'has a status of 200' do
      get user_posts_path(user.id)
      expect(response).to have_http_status(200)
    end

    it 'displays a list of posts for the user' do
      get user_posts_path(user.id)
      expect(response.body).to include('List of posts for User')
    end
  end

  describe 'GET /show' do
    let(:post) { Post.create!(title: 'Test Post', text: 'This is a test post.', author: user) }

    it 'renders the show template' do
      get user_post_path(user.id, post.id)
      expect(response).to render_template(:show)
    end

    it 'has a status of 200' do
      get user_post_path(user.id, post.id)
      expect(response).to have_http_status(200)
    end

    it 'displays the title of the post' do
      get user_post_path(user.id, post.id)
      expect(response.body).to include(post.title)
    end
  end
end
