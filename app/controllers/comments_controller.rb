class CommentsController < ApplicationController
  def create
    @comment = Comment.new(author_id: params[:user_id], post_id: params[:post_id], text: params[:comment][:text])
    if @comment.save
      redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  # def destroy
  #   @comment = Comment.find(params[:id])
  #   authorize! :destroy, @comment

  #   if @comment.destroy
  #     flash[:success] = "Comment deleted successfully."
  #     redirect_to user_post_path(@comment.post.author, @comment.post)
  #   else
  #     flash[:error] = "Failed to delete comment."
  #     redirect_to @comment.post
  #   end
  # end
end
