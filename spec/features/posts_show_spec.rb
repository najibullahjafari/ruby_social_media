RSpec.feature 'PostsShow', type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author: user) } # or the correct association
  let!(:comment1) { Comment.create(user:, post:, text: 'This is my first comment') }
  let!(:comment2) { Comment.create(user:, post:, text: 'This is my second comment') }

  scenario "Visiting a post's show page displays the post and allows commenting" do
    visit user_post_path(user, post)
    expect(page).to have_content(post.title)
    fill_in 'comment[text]', with: 'A new comment'
    click_button 'Submit'
    expect(page).to have_content('A new comment')
  end

  describe 'Post#show' do
    it 'shows the author' do
      expect(page).to have_content("Posted by #{user.name}")
    end

    it 'shows the number of comments' do
      expect(page).to have_content("Comments: #{post.comments_counter}")
    end

    it 'shows the number of likes' do
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end

    it 'shows the post text' do
      expect(page).to have_content(post.text)
    end

    it 'shows the username of each commentor' do
      expect(page).to have_content(comment1.user.name)
      expect(page).to have_content(comment2.user.name)
    end
    it 'shows the comment each commentor left' do
      expect(page).to have_content(comment1.text)
      expect(page).to have_content(comment2.text)
    end
  end
end
