class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user) # Associate the like with the current user

    if @like.save
      redirect_to post_path(@post), notice: 'Liked!'
    else
      redirect_to post_path(@post), alert: 'Error liking post.'
    end
  end
end
