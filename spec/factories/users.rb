FactoryBot.define do
  factory :user do
    name { 'Test User' }
    posts_counter { 0 }
    bio { 'Test bio.' }
    # ... other attributes
  end
end
