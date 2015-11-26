class PostsController < ApplicationController


  def index
    @posts = Post.all
    @latest_posts = Post.all.order(created_at: :desc)
    @covers = @posts.first(4)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to @post
  end


  private

  def post_params
    params.require(:post).permit(:title, :content, :summary, :cover)
  end
end
