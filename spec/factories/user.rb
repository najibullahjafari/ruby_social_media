FactoryBot.define do
  factory :user do
    name { 'Test User' }
    bio { 'This is a test user.' }
    posts_counter { 0 }
  end
end
