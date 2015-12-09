class Api::UsersController < Api::ApiController

  def show
    @user = User.find(params[:id])
    render json: @user
  end

end
