FactoryBot.define do
  factory :comment do
    content { 'Test Comment' }
    user { create(:user) }
    post { create(:post) }
  end
end
