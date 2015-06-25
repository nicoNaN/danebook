class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      if params[:remember_me]
        permanent_sign_in(@user)
      else
        sign_in(@user)
      end
      flash[:success] = "Welcome, #{@user.first_name}!"
      redirect_to root_path
    else
      flash.now[:error] = "Couldn't sign you in!"
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    flash[:success] = "See you, space cowboy..."
    redirect_to root_path
  end
end
