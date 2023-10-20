require 'rails_helper'
require 'tools/test_data'

RSpec.describe 'User index', type: :system do
  include TestData
  describe 'index page' do
    before(:each) do
      call_test_data
    end
    before(:all) do
      @user = User.create(name: 'Martin', photo: 'https://example.jpg', bio: 'Eng')
    end
    it "Redirected user's show page When I click on a user" do
      visit users_path
      click_link @user.name
      expect(page).to have_current_path(user_path(@user))
    end
    it 'shows the username of all users' do
      visit users_path
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end
    it 'Shows the profile picture of all users' do
      visit users_path
      expect(page).to have_css("img.user-photo[src*='https://example.jpg3']")
      expect(page).to have_css("img.user-photo[src*='https://example.jpg2']")
    end

    it 'Shows the number of user has writen' do
      visit users_path
      expect(page).to have_content('2 Posts')
      expect(page).to have_content('0 Posts')
    end
  end
end
