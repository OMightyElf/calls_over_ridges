class PagesController < ApplicationController
	def index
		@posts = Post.all.publish.order(publish_date: :desc).limit(3)
		@pinned_post_with_img = Post.pinned.publish.has_cover.first
		@pinned_post_with_video = Post.pinned.publish.has_video.first
	end

	def about
	end

	def sponsor_project
	end

	def aurora
	end
end
