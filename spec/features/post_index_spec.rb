require 'rails_helper'
require 'tools/test_data'

RSpec.describe 'User post index page', type: :feature do
  include TestData
  before(:each) do
    call_test_data
    visit user_posts_path(@user1)
  end

  scenario 'I can see the user\'s profile picture' do
    expect(page).to have_css("img.profile-photo[src*='https://example.jpg']")
  end

  scenario 'I can see the user\'s username' do
    expect(page).to have_content(@user1.name)
  end

  scenario 'I can see the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 10') # Assuming 10 posts were created in the before block
  end

  scenario 'I can see a post\'s title' do
    expect(page).to have_content(@posts.first.title)
  end

  scenario 'I can see some of the post\'s body' do
    expect(page).to have_content(@posts.first.body.truncate(100))
  end

  scenario 'I can see the first comments on a post' do
    expect(page).to have_content('Comments:')
    expect(page).to have_content('Comment 1')
    expect(page).to have_content('Comment 2')
  end

  scenario 'I can see how many comments a post has' do
    expect(page).to have_content('Comments: 2')
  end

  scenario 'I can see how many likes a post has' do
    # Add code to display the number of likes on the post, e.g., 'Likes: 5'
    expect(page).to have_content('Likes: 3')
  end

  scenario 'I can see a section for pagination if there are more posts than fit on the view' do
    # Assuming 10 posts are created, and per your pagination settings, you want to show 5 per page
    expect(page).to have_css('div.pagination')
  end

  scenario 'When I click on a post, it redirects me to that post\'s show page' do
    click_link 'Post 1'
    # expect(current_path).to eq(user_post_path(@user1, @posts[0]))
    expect(page).to have_current_path(user_post_path(@user1, @posts[0]))
  end
end
