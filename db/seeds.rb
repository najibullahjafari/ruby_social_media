require 'faker'

# Create 15 users
users = 15.times.map do
  User.create!(
    name: Faker::Name.name,
    bio: Faker::Lorem.sentence(word_count: rand(7..15)),
    photo: Faker::Avatar.image(slug: Faker::Internet.unique.username, size: "120x120")
  )
end

# For each user, create 10 posts
users.each do |user|
  15.times do
    post = user.posts.create!(
      title: Faker::Book.title,
      body: Faker::Lorem.paragraph(sentence_count: rand(5..25))
    )

    # Each of the other users comments once on the post
    (users - [user]).each do |commenter|
      post.comments.create!(
        content: Faker::Lorem.sentence(word_count: rand(1..15)),
        user: commenter
      )
    end
  end
end
