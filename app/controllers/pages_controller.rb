class PagesController < ApplicationController
	def index
	  @posts = Post.all
	  @latest_posts = Post.all.order(created_at: :desc)
	  @covers = @posts.first(4)
	end

	def show_posts
		@posts = Post.where(id: PostTag.where(tag_id: params[:id]).pluck(:post_id))
	end
end
