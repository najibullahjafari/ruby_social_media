require 'rails_helper'
require 'tools/test_data'

RSpec.describe 'Post show page', type: :feature do
  include TestData
  before(:all) do
    call_test_data
  end

  it 'I can see the post title' do
    visit post_path(@post_with_comments)
    expect(page).to have_content(@post_with_comments.text)
  end

  it 'I can see who wrote the post' do
    visit post_path(@post_with_comments)
    expect(page).to have_content(@user1.name)
  end

  it 'I can see how many comments it has' do
    visit post_path(@post_with_comments)
    expect(page).to have_content('Comments: 2') # Assuming 2 comments were created
  end

  it 'I can see how many likes it has' do
    visit post_path(@post_with_comments)
    expect(page).to have_content('Likes: 3')
  end

  it 'I can see the post body' do
    visit post_path(@post_with_comments)
    expect(page).to have_content(@post_with_comments.body)
  end

  it 'I can see the username of each commentor' do
    visit post_path(@post_with_comments)
    expect(page).to have_content(@comment1.user.name)
    expect(page).to have_content(@comment2.user.name)
  end

  it 'I can see the comment each commentor left' do
    visit post_path(@post_with_comments)
    expect(page).to have_content(@comment1.content)
    expect(page).to have_content(@comment2.content)
  end
end
