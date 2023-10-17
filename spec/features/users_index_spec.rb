require 'rails_helper'

RSpec.feature 'UsersIndex', type: :feature, js: true do
  before do
    # Assuming you have FactoryBot setup, you can create necessary records here.
    # Example:
    FactoryBot.create_list(:user, 5)
  end

  scenario 'Visiting the users index page displays all users' do
    visit users_path
    User.all.each do |user|
      expect(page).to have_content(user.name)
    end
  end
end
