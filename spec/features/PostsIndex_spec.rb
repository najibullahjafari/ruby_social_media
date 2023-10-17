RSpec.feature "PostsIndex", type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }

  scenario "Visiting the posts index page displays all posts for a specific user" do
    visit user_posts_path(user)
    user.posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end
end
