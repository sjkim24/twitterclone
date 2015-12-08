class FollowsController < ApplicationController

  def index
    @follows = Follows.all
    render :index
  end

  def create
    @follow = Follow.new(follow_params)

    if @follow.save

    else
      flash.now[:errors] = @follow.errors.full_messages
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
  end

end
