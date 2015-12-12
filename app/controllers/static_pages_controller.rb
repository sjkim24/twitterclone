class StaticPagesController < ApplicationController

  def root
    if current_user.nil?
      redirect_to new_session_url
    end
  end

end
