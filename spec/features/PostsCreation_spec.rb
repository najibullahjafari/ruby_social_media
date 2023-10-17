RSpec.feature "PostsCreation", type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }

  scenario "Creating a post successfully" do
    visit new_user_post_path(user)
    fill_in "post[title]", with: "New Post"
    fill_in "post[text]", with: "Post content"
    click_button "Create Post"
    expect(page).to have_content("Post was successfully created.")
  end

  scenario "Fail to create a post" do
    visit new_user_post_path(user)
    fill_in "post[title]", with: "" # Empty title to trigger validation error
    fill_in "post[text]", with: "Post content"
    click_button "Create Post"
    expect(page).to have_content("Error") # Assuming you display a generic "Error" message on validation failure
  end
end
