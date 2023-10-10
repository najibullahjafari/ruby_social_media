require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post).counter_cache(true) }
  end

  describe 'methods' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }

    describe '#update_comment_count' do
      it 'increments the comments_counter' do
        post = Posts.new

        expect do
          post.update_comment_counter
        end.to change {
          post.comments_counter
        }.by(1)
      end
    end
  end
end
