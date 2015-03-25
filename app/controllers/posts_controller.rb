class PostsController < ApplicationController

  before_action :owner_of_post, only: [:edit, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "There\'s still time to change the road your on"
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def owner_of_post
    @post.user_id == current.user.id
  end
      
end
