FactoryBot.define do
  factory :comment do
    text { 'Comment Text' }
    association :user, factory: :user
    association :post, factory: :post
  end
end
