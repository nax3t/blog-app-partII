class PostsController < ApplicationController
	before_action :find_post, except: [:index, :new, :create]

	def index
		@posts = Post.all
	end

	def show
		# find_post being called before action is run
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		@post.save
		redirect_to @post
	end

	def edit
		# find_post being called before action is run
	end

	def update
		# find_post being called before action is run
		@post.update(post_params)
		redirect_to @post
	end

	def destroy
		# find_post being called before action is run
		if @post.user == current_user 
			@post.destroy
			flash[:notice] = "Post successfuly destroyed"
			redirect_to posts_path
		else
			flash[:alert] = "You don't own this post, sorry"
			redirect_to @post
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :image, :body, :user_id)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
