require 'rails_helper'

RSpec.describe 'Users', type: :request do
  

  describe 'GET /show' do
    let(:user) { User.create!(name: 'Test User', bio: 'Test bio.') }
    it 'displays the profile page of another user' do
      other_user = User.create!(name: 'Other User', bio: 'Bio for Other User')
      get user_path(other_user)
      expect(response).to have_http_status(200)
      expect(response.body).to include(other_user.name)
      expect(response.body).to include(other_user.bio)
    end
  end

  describe 'Users GET /users#index' do
  it 'checks if response status was correct' do
    get users_path, headers: { "HTTP_ACCEPT" => "application/json" }

    expect(response).to have_http_status(:success)
  end
end






end
