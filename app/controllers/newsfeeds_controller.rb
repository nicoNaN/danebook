class NewsfeedsController < ApplicationController
  before_filter :redirect_if_different_user, only: :show

  def show
    @user = User.find(params[:user_id])
  end

  def redirect_if_different_user
    if current_user.id != params[:user_id].to_i
     redirect_to user_profile_path(current_user.id) if current_user.id != params[:user_id].to_i
     flash[:error] = "You're not authorized to view that!"
    end
  end
end
