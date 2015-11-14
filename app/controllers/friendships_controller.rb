class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend!"
      redirect_to request.referer
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendships.where("friend_id IS ?", params[:id]).first
    @friendship.destroy
    flash[:notice] = "Removed friend :("
    redirect_to root_url
  end
end
