class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 2)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(author_id: params[:post][:user_id], title: params[:post][:title], text: params[:post][:text])
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_path(params[:post][:user_id]), notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])

    authorize! :destroy, @post

    if @post.destroy
      flash[:success] = 'Post deleted successfully.'
      redirect_to user_posts_path(@post.author)
    else
      flash[:error] = 'Failed to delete post.'
      redirect_to @post
    end
  end
end
