class Api::UsersController < Api::ApiController

  def index
    @users = User.all

    render :index
  end

  def show
    @user = User.find(params[:id])
    @user_tweets = @user.tweets.order(created_at: :desc)
    @follow = Follow.find_by(
      follower_id: current_user.id,
      user_id: @user.id
    )
    @follow ? @following = true : @following = false

    @followings = @user.followings
    @followers = @user.followers

    render :show
  end

end
