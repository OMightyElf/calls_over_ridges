class PagesController < ApplicationController
	def index
	  @posts = Post.all
	  @latest_posts = Post.all.order(created_at: :desc)
	  @covers = @posts.first(4)
		# render layout: "layout_with_cover"
	end

	def show_posts_with_tag
		@tag = Tag.find_by(name_en: params[:name_en])
		@posts = @tag.posts

	end

	def aboutus
	end
end
