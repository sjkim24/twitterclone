class Api::UsersController < Api::ApiController

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order(created_at: :desc)
    render :show
  end

end
