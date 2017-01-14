class PagesController < ApplicationController
	def index
	  @posts = Post.all
	  @latest_posts = Post.all.order(created_at: :desc)
	  @covers = @posts.first(4)
	end

	def sponsor_project
	end

	def search
		# @posts = Post.where("title like ?", "%"+params[:keyword]+"%")

		# if params[:search]
     @posts = Post.search(params[:keyword]).order("created_at DESC")
	end

	def aboutus
	end


end
