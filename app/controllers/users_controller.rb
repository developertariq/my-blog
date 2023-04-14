class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.includes(posts: [:comments]).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user.as_json(include: {posts: {include: {comments: {only: [:id, :text]}}, only: [:id, :title, :text]}}, only: [:id, :name, :photo, :bio]) }
    end
  end
end
