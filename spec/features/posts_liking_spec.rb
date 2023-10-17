RSpec.feature 'PostsLiking', type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author: user) } # or the correct association

  scenario 'Liking a post increases its likes count' do
    visit user_post_path(user, post)

    # Assuming there's a button or link with the text "Like" to like a post
    click_on 'Like'

    # This check assumes you display the likes count somewhere on the post's show page.
    # For example, it might look like "Likes: 1" after liking the post.
    expect(page).to have_content('Likes: 1')
  end
end
