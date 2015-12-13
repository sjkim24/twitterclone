class Api::CurrentUsersController < Api::ApiController

  def show
    @current_user = current_user

    render :show
  end

end
