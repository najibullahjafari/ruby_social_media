FactoryBot.define do
  factory :post do
    title { 'Test Post' }
    text { 'This is a test post' }
    comments_counter { 0 }
    likes_counter { 0 }
    association :author, factory: :user
  end
end
