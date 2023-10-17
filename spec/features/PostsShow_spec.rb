RSpec.feature "PostsShow", type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author: user) }  # or the correct association

  scenario "Visiting a post's show page displays the post and allows commenting" do
    visit user_post_path(user, post)
    expect(page).to have_content(post.title)
    fill_in "comment[text]", with: "A new comment"
    click_button "Submit"
    expect(page).to have_content("A new comment")
  end
end
