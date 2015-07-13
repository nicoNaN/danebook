class ProfilesController < ApplicationController
  before_action :require_current_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def update
    @user = current_user
    @profile = current_user.profile
    if @profile.update(profile_params)
      flash[:success] = "Updated your profile!"
      render :show
    else
      flash[:error] = "Problem updating your profile! Please fix errors."
      render :edit
    end
  end

  def profile_params
    params.require(:profile).permit(:user_id, :first_name, :college, :hometown, :residence, :phone_number, :quotes, :about)
  end
  
end
