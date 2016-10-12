class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build(comment_params)
    @comment.user = current_user
  	@comment.save
  	redirect_to @post
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.update(comment_params)
    else
      flash[:alert] = "You don't own this comment, sorry."
    end
    redirect_to @post
  end

  def destroy
  	@post = Post.find(params[:post_id])
  	@comment = Comment.find(params[:id])
    if @comment.user == current_user
    	@comment.destroy
      flash[:notice] = "Comment successfully deleted."
    else
      flash[:alert] = "You don't own this comment, sorry."
    end
  	redirect_to @post
  end

  private

  def comment_params
		params.require(:comment).permit(:body, :user_id)
	end
end
