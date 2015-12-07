class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      render json: "Wrong username/password"
    else
      render json: "Hello #{user.username}"
    end
  end

  def new
    render :new
  end

end
