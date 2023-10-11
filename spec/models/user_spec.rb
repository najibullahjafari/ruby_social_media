require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with a name and posts_counter >= 0' do
      user = User.new(name: 'Masuma', posts_counter: 5)
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(posts_counter: 3)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is invalid if posts_counter is not an integer' do
      user = User.new(name: 'Jaffery', posts_counter: 'invalid')
      user.valid? # Ensure validations are run
      expect(user.errors[:posts_counter]).to include('is not a number')
    end

    it 'is invalid if posts_counter is less than 0' do
      user = User.new(name: 'Bob', posts_counter: -1)
      expect(user).not_to be_valid
      expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
    end
  end
end
