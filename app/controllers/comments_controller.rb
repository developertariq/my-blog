class CommentsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    post = user.posts.find(params[:post_id])
    comments = post.comments
    render json: comments
  end

  def create
    @comment = Comment.new(author_id: params[:user_id], post_id: params[:post_id], text: params[:comment][:text])
    redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Comment was successfully created.'
    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Comment was successfully created.'
        end
        format.json do
          render json: { status: 'success', message: 'Comment created successfully', data: @comment }, status: :created
        end
      else
        format.html { render :new }
        format.json do
          render json: { status: 'error', message: 'Failed to create comment' }, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment

    if @comment.destroy
      flash[:success] = 'Comment deleted successfully.'
      redirect_to user_post_path(@comment.post.author, @comment.post)
    else
      flash[:error] = 'Failed to delete comment.'
      redirect_to @comment.post
    end
  end
end
