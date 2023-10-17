RSpec.feature "UsersShow", type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) } # Assuming you have a user factory

  scenario "Visiting a user's show page displays their posts" do
    visit user_path(user)
    expect(page).to have_content(user.name)
    user.posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end
end
