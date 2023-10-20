module LikesHelper
  def like_post(post)
    if @liked_post_ids.include?(post.id)
      like = @likes[post.id]
      button_to 'Unlike', like_path(like), method: :delete, class: 'btn btn-primary'
    else
      button_to 'Like', post_likes_path(post), class: 'btn btn-primary'
    end
  end
end