class TweetsController < ApplicationController

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    if @tweet.save



  end

  def new

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet)
  end


end
