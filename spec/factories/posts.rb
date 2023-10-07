class Posts
  attr_accessor :comments, :likes_counter, :comments_counter

  def initialize
    @comments = []
    @likes_counter = 0
    @comments_counter = 0
  end

  def add_comment(comment)
    @comments << comment
  end

  def update_comment_counter
    @comments_counter += 1
  end

  def recent_comments
    @comments.sort_by(&:created_at).last(5).reverse
  end

  def update_like_counter
    @likes_counter += 1
  end
end
