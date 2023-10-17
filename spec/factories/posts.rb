# spec/factories/posts.rb

FactoryBot.define do
  factory :post do
    title { "Sample Post Title #{Faker::Lorem.word}" }
    comments_counter { 0 }
    likes_counter { 0 }
    association :author, factory: :user
  end
end
