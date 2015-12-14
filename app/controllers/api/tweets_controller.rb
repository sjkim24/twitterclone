class Api::TweetsController < Api::ApiController

  def index
    @my_tweets = current_user.tweets

    @followings_ids = []
    @followings_tweets = []

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

    render :index
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    if @tweet.save
      render json: @tweet
    else
      render json: @tweet.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    render :show
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    render :show
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet)
  end

end
