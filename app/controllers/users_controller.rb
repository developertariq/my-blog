class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.includes(posts: [:comments]).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json do
        render json: @user.as_json(
          include: { posts: { include: { comments: { only: %i[id text] } },
                              only: %i[id title text] } }, only: %i[id name photo bio]
        )
      end
    end
  end
end
