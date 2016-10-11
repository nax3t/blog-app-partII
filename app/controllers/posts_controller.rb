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
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :author, :image, :body)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
