class PostsController < ApplicationController
	
	before_action :load_post,  only: [:show, :edit, :update, :destroy ]

	def index
	end
	
	def new
		@post = Post.new
	end	

	def create
		@post = Post.new post_params

		if @post.save
			redirect_to @post, notice: "New Post added successfully"	
		else
			render 'new', notice: "Post was not created please try again"
		end	
	end

	def show
	end	

	def edit
	end
	
	def update
		if @post.update post_params
			redirect_to @post, notice: "Post updated successfully" 
		else
			render 'edit'	
		end	
	end	

	def destroy
		@post.destroy
		redirect_to posts_path
	end 	
	
	private 

	def load_post
		@post = Post.find(params[:id])
	end 
		
	def post_params
		params.require(:post).permit(:title, :description)
	end	
end
