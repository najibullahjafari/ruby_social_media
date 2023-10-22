FactoryBot.define do
  factory :user do
    name { 'Test User' }
    posts_counter { 0 }
    bio { 'Test bio.' }
  end
end
