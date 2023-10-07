FactoryBot.define do
  factory :post do
    title { 'Test Title' }
    comments_counter { 0 }
    # ... other attributes
    author { create(:user) }
  end
end
