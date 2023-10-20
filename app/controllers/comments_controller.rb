class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @current_user = current_user
    @comment = @current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(@current_user, @comment.post)
    else
      @post = Post.find(params[:post_id])
      redirect_to post_path(@post)

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    user = comment.user

    return unless comment.destroy

    redirect_to user_post_url(user, post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content) # Add other comment attributes if any
  end
end
