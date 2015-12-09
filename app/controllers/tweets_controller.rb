class TweetsController < ApplicationController

  def index
    @my_tweets = current_user.tweets

    @followings_ids = []
    @followers_ids = []
    @followings_tweets = []

    current_user.follows.each do |follow|
      @followers_ids << User.find(follow.follower_id).id
    end

    @followings = Follow.where(follower_id: current_user.id)

    @followings.each do |following|
      @followings_ids << following.user_id
    end

    @followings_ids.each do |following_id|
      @followings_tweets << Tweet.where(user_id: following_id)
    end

    @all_tweets = @my_tweets + @followings_tweets
    @all_tweets = @all_tweets.flatten.sort_by { |tweet| tweet.created_at }.reverse
    @all_tweets = @all_tweets.flatten
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    if @tweet.save
      redirect_to(:back)
    else
      flash.now[:errors] = @user.errors.full_messages
    end
  end

  def new
    @tweet = Tweet.new
    render :new
  end

  def edit
    @tweet = Tweet.find(params[:id])
    render :edit
  end

  def update
    @tweet = Tweet.find(params[:id])

    if @tweet.update(tweet_params)
      redirect_to user_url(current_user.id)
    else
       flash.now[:errors] = @tweet.errors.full_messages
    end
  end

  def destroy
    @tweet = User.find(params[:id])
    @tweet.destroy
    redirect_to user_url(current_user.id)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet)
  end


end
