class PostsController < ApplicationController
  def index
    if params[:user_id].present?
      @user = User.includes(posts: :comments).find_by(id: params[:user_id])

      if @user
        @posts = @user.posts.includes(comments: :user)
      else
        # Handle the case when the user is not found.
        redirect_to users_path, alert: 'User not found'
      end
    else
      # Handle the case where user_id is not provided (e.g., after deleting a post).
      redirect_to users_path # Redirect to a user listing page, for example.
    end
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
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.author == current_user
      # Decrement the user's post counter
      current_user.decrement!(:posts_counter)
      # Destroy the post
      @post.destroy

      redirect_to users_path, notice: 'Post was successfully deleted.'
    else
      redirect_to users_path, alert: 'You are not authorized to delete this post.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body) # Add other post attributes if any
  end
end
