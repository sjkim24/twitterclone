class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to user_url(@user.id)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find(params[:id])
    @user_tweets = @user.tweets
    @following = Follow.where(
      follower_id: current_user.id,
      user_id: @user.id
    )
    render :show
  end

  def destroy
   @user = User.find(params[:id])
   @user.destroy
   redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
