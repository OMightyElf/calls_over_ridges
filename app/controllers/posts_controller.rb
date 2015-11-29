class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    # @hot_posts = Post.all.order(view_count: :desc)
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
    params.require(:post).permit(:title, :content, :summary, :cover, tag_id: [])
  end
end
