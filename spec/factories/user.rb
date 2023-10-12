FactoryBot.define do
  factory :user do
    name { 'Test User' }
    email { 'najib@gmail.com' }
    posts_counter { 0 }
    id { 1}
  end
end