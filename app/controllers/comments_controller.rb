class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully added.'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content) # Add other comment attributes if any
  end
end
