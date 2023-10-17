require 'rails_helper'

RSpec.describe CommentsController, type: :request do
  describe 'POST #create' do
    let(:user) { create(:user) } # Assuming you're using FactoryBot
    let(:post) { create(:post, author: user) }
    let(:valid_attributes) { { text: 'A valid comment' } }
    let(:invalid_attributes) { { text: '' } }

    it 'creates a comment and redirects to user_post_path' do
      post user_post_comments_path(user.id, post.id)
      expect(response).to redirect_to(user_post_path(user, post))
      expect(flash[:notice]).to eq('Comment added successfully.')
    end

    it 'fails to create a comment and redirects with an error' do
      post user_post_comments_path(user.id, post.id)
      expect(response).to redirect_to(user_post_path(user, post))
      expect(flash[:alert]).to eq('Failed to add a comment.')
    end
  end
end
