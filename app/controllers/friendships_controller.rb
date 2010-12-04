class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend"
    else
      flash[:error] = "Error adding the friendship"
    end
    redirect_to :back
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    if @friendship.destroy
      flash[:notice] = "Removed friend"
    else
      flash[:error] = "Could not remove friend"
    end
    redirect_to :back
  end
end
