class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment added successfully.'
    else
      redirect_to user_post_path(@user, @post), alert: 'Failed to add a comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
