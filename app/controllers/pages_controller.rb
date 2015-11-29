class PagesController < ApplicationController
	def index
	  @posts = Post.all
	  @latest_posts = Post.all.order(created_at: :desc)
	  @covers = @posts.first(4)
	  @main_issue_posts = Tag.issue_tag.online_tag.last.try(:posts)
	end

	def show_posts_with_tag
		@tag = Tag.find_by(name_en: params[:name_en])
		@posts = @tag.posts
	end

	def search
		# @posts = Post.where("title like ?", "%"+params[:keyword]+"%")

		# if params[:search]
     @posts = Post.search(params[:keyword]).order("created_at DESC")
	end

	def aboutus
	end


end
