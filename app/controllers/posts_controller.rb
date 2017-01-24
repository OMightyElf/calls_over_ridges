class PostsController < ApplicationController
  def index
    @posts = Post.all.publish.order(publish_date: :desc)
    @pinned_post_with_img = Post.pinned.publish.has_cover.first
    @pinned_post_with_video = Post.pinned.publish.has_video.first
  end

  def show
    @post = Post.find(params[:id])
    @latest_posts = Post.all.publish.order(publish_date: :desc).limit(3)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to @post
  end
end
