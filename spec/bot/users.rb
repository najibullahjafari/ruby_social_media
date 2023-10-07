FactoryBot.define do
  factory :user do
    name { 'user' }
    email { 'emaole@yahoo.com' }
    posts_counter { 0 }
  end
end
