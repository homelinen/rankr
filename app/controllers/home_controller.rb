class HomeController < ApplicationController
  def index
    if current_user
      @tournaments = Tournament.where(:user_id => current_user.id)
      @user_page = true

      render 'tournaments/index'
    else
      render 
    end
  end
end
