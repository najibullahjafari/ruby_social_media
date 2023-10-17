RSpec.feature "PostsCommenting", type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author: user) }  # if Post belongs_to :author, class_name: "User"

  scenario "Adding a comment to a post" do
    visit user_post_path(user, post)
    
    fill_in "comment[text]", with: "This is a test comment!"
    click_button "Submit"
    
    expect(page).to have_content("This is a test comment!")
  end
end
