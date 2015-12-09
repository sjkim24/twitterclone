class Api::TweetsController < Api::ApiController

  def index

  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    if @tweet.save
      render :show
    else
      render json: @tweet.errors.full_messages, status: :unprocessable_entity
    end
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
