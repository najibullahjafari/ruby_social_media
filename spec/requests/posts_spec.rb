# spec/models/post_spec.rb

require 'rails_helper'

RSpec.describe Post, type: :model do
  # For creating valid objects during testing
  let(:user) { create(:user) }
  let(:valid_post) { build(:post, author: user) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(valid_post).to be_valid
    end

    it 'is not valid without a title' do
      valid_post.title = nil
      expect(valid_post).to_not be_valid
    end

    it 'is not valid with a title longer than 250 characters' do
      valid_post.title = 'A' * 251
      expect(valid_post).to_not be_valid
    end

    it 'is not valid without an associated author' do
      valid_post.author = nil
      expect(valid_post).to_not be_valid
    end

    # Add other validations as necessary
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  # Add tests for other methods or functionalities if they exist
  describe 'methods' do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post, author: user) }
  end

  describe 'update_user_posts_counter' do
    it 'updates the posts_counter of the author' do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, author: user)
      initial_count = user.posts_counter

      # Now, decrement the counter to simulate a scenario where we want to test the increment function
      user.decrement!(:posts_counter)

      # Call the method
      post.update_user_posts_counter

      expect(user.reload.posts_counter).to eq(initial_count)
    end
  end
end
