module TestData
  def call_test_data
    @user1 = User.create(name: 'Mohammad', photo: 'https://example.jpg', bio: 'Eng')
    @user2 = User.create(name: 'Mohammad1', photo: 'https://example.jpg2', bio: 'Eng')
    @user3 = User.create(name: 'Mohammad2', photo: 'https://example.jpg3', bio: 'Eng', posts_counter: 2)

    # Create multiple posts for the user
    @posts = []
    (1..10).each do |i|
      @posts << Post.create(author: @user1, title: "Post #{i}", body: "Body of post #{i}")
    end

    @post_with_comments = @posts.first
    @comment1 = Comment.create(content: 'Comment 1', user: @user1, post: @post_with_comments)
    @comment2 = Comment.create(content: 'Comment 2', user: @user1, post: @post_with_comments)
    Like.create(user: @user1, post: @post_with_comments)
    Like.create(user: @user1, post: @post_with_comments)
    Like.create(user: @user1, post: @post_with_comments)
  end
end
