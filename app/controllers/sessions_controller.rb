class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      render json: "Wrong username/password"
    else
      login!(user)
      redirect_to user_url(user.id)
    end
  end

  def new
    render :new
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
