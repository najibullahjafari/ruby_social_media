class PostsController < ApplicationController
  def index
    @user = User.includes(posts: :comments).find(params[:user_id])
    @posts = @user.posts.includes(comments: :user)
  end

  # This action is for rendering the form to create a new post.
  def new
    if user_signed_in?
      @post = current_user.posts.build
    else
      redirect_to new_user_session_path, alert: 'You must be logged in to create a post.'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

   def create
    @user = User.find(params[:user_id])
    @post = Post.new(
      author: current_user,
      likes_counter: 0,
      comments_counter: 0,
      content: post_params[:content],
      text: post_params[:text]
    )

  def destroy
    post = Post.find(params[:id])

    authorize! :destroy, post # authorization check

    post.comments.destroy_all
    post.likes.destroy_all

    post.destroy

    redirect_to users_path, notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body) # Add other post attributes if any
  end
end
