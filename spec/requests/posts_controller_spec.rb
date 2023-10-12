require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { User.create!(name: 'Test User', bio: 'Test bio.') }

  describe 'GET #index' do
    it 'If the response body includes correct placeholder text.' do
      user.posts.create(title: 'Post 1', text: 'This is post 1')
      user.posts.create(title: 'Post 2', text: 'This is post 2')

      get :index, params: { user_id: user.id }
      expect(assigns(:user)).to eq(user)
      expect(assigns(:posts)).not_to be_empty
    end

    it 'returns a successful response' do
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

    it 'If the response body includes correct placeholder text.' do
      get :show, params: { user_id: user.id, id: post.id }
      expect(assigns(:user)).to eq(user)
      expect(assigns(:post)).to eq(post)
    end

    it 'If response status was correct.' do
      get :show, params: { user_id: user.id, id: post.id }
      expect(response).to have_http_status(200)
    end

    it 'If a correct template was rendered.' do
      get :show, params: { user_id: user.id, id: post.id }
      expect(response).to render_template(:show)
    end
  end
end
