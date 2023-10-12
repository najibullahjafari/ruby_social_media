require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { User.create!(name: 'Test User', bio: 'Test bio.') }

  describe 'GET #index' do
    it 'assigns @user and @posts' do
      user.posts.create(title: 'Post 1', text: 'This is post 1')
      user.posts.create(title: 'Post 2', text: 'This is post 2')

      get :index, params: { user_id: user.id }
      expect(assigns(:user)).to eq(user)
      expect(assigns(:posts)).not_to be_empty
    end
  end

  describe 'GET #show' do
    let(:post) { Post.create!(title: 'Test Post', text: 'This is a test post.', author: user) }

    it 'assigns @user and @post' do
      get :show, params: { user_id: user.id, id: post.id }
      expect(assigns(:user)).to eq(user)
      expect(assigns(:post)).to eq(post)
    end

    it 'returns a successful response' do
      get :show, params: { user_id: user.id, id: post.id }
      expect(response).to have_http_status(200)
    end
  end
end
