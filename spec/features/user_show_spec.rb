require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  before do
    @user = create(:user, name: 'John', photo: 'https://example.jpg', bio: 'Software Engineer')
    @post1 = create(:post, author: @user, title: 'Post 1', body: 'Body of post 1')
    @post2 = create(:post, author: @user, title: 'Post 2', body: 'Body of post 2')
    @post3 = create(:post, author: @user, title: 'Post 3', body: 'Body of post 3')

    visit user_path(@user)
  end

  it 'displays the user profile picture' do
    expect(page).to have_css('img.profile-photo')
  end

  it 'displays the user username' do
    expect(page).to have_content('John')
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 3')
  end

  it 'displays the user bio' do
    expect(page).to have_content('Bio')
    expect(page).to have_content('Software Engineer')
  end

  it 'displays the first 3 posts' do
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')
  end

  it 'displays a button to view all of a user\'s posts' do
    expect(page).to have_link('See all posts', href: user_posts_path(@user))
  end

  it 'redirects to the post show page when clicking on a user\'s post' do
    click_link('Post 1')
    expect(page).to have_current_path(user_post_path(@user, @post1))
  end

  it 'redirects to the user post index page when clicking on "See all posts"' do
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
