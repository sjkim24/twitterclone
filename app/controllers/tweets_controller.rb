class TweetsController < ApplicationController

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    if @tweet.save
      redirect_to user_url(current_user.id)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
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

  private

  def tweet_params
    params.require(:tweet).permit(:tweet)
  end


end
