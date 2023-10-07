require_relative '../factories/posts'
RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'callbacks' do
    describe '#update_like_count' do
      it 'increments the likes_counter' do
        posts = Posts.new

        expect do
          posts.update_like_counter
        end.to change {
          posts.likes_counter
        }.by(1)
      end
    end
  end
end
