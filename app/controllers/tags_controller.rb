class TagsController < ApplicationController
	def show_posts
		@posts = Post.where(id: PostTag.where(tag_id: params[:id]).pluck(:post_id))
	end
end
