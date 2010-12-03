class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend"
      redirect_to root_url
    else
      flash[:error] = "Error adding the friendship"
      redirect_to root_url
    end

    def destroy
      @friendship = current_user.friendships.find(params[:friend_id])
      if @friendship.destroy
        flash[:notice] = "Removed friend"
      else
        flash[:error] = "Could not remove friend"
      end
      redirect_to root_url
    end
end
