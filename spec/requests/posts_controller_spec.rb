require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { User.create!(name: 'Test User', bio: 'Test bio.') }

  describe 'GET #index' do
    it 'returns a successful response' do
      user.posts.create(title: 'Post 1', text: 'This is post 1')
      user.posts.create(title: 'Post 2', text: 'This is post 2')

      get :index, params: { user_id: user.id }
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index, params: { user_id: user.id }
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:post) { Post.create!(title: 'Test Post', text: 'This is a test post.', author: user) }

    it 'returns a successful response' do
      get :show, params: { user_id: user.id, id: post.id }
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get :show, params: { user_id: user.id, id: post.id }
      expect(response).to render_template(:show)
    end
  end
end
