require 'rails_helper'
RSpec.describe 'Users', type: :request do
  describe 'GET #show' do
    it 'If the response body includes correct placeholder text' do
      user_to_show = User.create!(name: 'User to Show', bio: 'Bio to Show')
      get user_path(user_to_show)

      expect(assigns(:user)).to eq(user_to_show)
      expect(response).to render_template(:show)
    end

    it 'returns a successful response' do
      user = User.create(name: 'Test User', bio: 'Test bio')
      get user_path(user.id, format: :json)

      expect(response).to have_http_status(:success)
    end

    it 'checks if response status was correct' do
      other_user = User.create!(name: 'JSON User', bio: 'JSON bio')
      get user_path(other_user), as: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #index' do
    it 'If the response body includes correct placeholder text' do
      user1 = User.create(name: 'User 1', bio: 'Bio 1')
      user2 = User.create(name: 'User 2', bio: 'Bio 2')

      get users_path
      expect(assigns(:users)).to include(user1, user2)
    end

    it 'returns a successful response' do
      get users_path

      expect(response).to have_http_status(:success)
    end

    it 'checks if response status was correct' do
      get users_path, params: { format: :json }

      expect(response).to have_http_status(:success)
    end
  end
end
