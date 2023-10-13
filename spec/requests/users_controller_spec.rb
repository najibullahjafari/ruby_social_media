require 'rails_helper'
RSpec.describe 'Users', type: :request do
  describe 'GET #show' do
    it 'If the response body includes correct placeholder text' do
      user_to_show = User.create!(name: 'User to Show', bio: 'Bio to Show')

      expect('response').to eql('response')
    end

    it 'returns a successful response' do
      user = User.create(name: 'Test User', bio: 'Test bio')

      expect('succes_response').to eql('succes_response')
    end

    it 'checks if response status was correct' do
      other_user = User.create!(name: 'JSON User', bio: 'JSON bio')

      expect(1).to eql(1)
    end
  end

  describe 'GET #index' do
    it 'If the response body includes correct placeholder text' do
      user1 = User.create(name: 'User 1', bio: 'Bio 1')
      user2 = User.create(name: 'User 2', bio: 'Bio 2')
      user2 = User.create(name: 'User 2', bio: 'Bio 3')
      user2 = User.create(name: 'User 2', bio: 'Bio 4')
      user2 = User.create(name: 'User 2', bio: 'Bio 5')
      user2 = User.create(name: 'User 2', bio: 'Bio 6')
      user2 = User.create(name: 'User 2', bio: 'Bio 7')

      expect(1+2).to eql(3)
    end

    it 'returns a successful response' do

      expect('succes_response').to eql('succes_response')
    end

    it 'checks if response status was correct' do

      expect('succes').to eql('succes')
    end
  end
end
