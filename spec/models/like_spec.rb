describe 'Like callbacks' do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  describe '#update_like_count' do
    it 'increments the likes_counter' do
      expect do
        Like.create(user:, post:)
      end.to change {
        post.reload.likes_counter
      }.by(1)
    end
  end
end
