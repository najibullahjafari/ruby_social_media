FactoryBot.define do
  factory :post do
    title { 'Specific Test Title' }
    body { 'This is a test post.' }
    comments_counter { 0 }

    author { create(:user) }
  end
end
