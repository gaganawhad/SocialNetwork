class MembershipsController < ApplicationController
  def create
    @membership = current_user.memberships.build(:group_id => params[:id], :owner => false, :admin => false)
    if @membership.save
      params[:notice] = "Joined Group"
    else
      prams[:error] = "Could not join group"
    end
    redirect_to :back
  end
  def destroy 
    @membership = Membership.find(params[:id])
    if @membership.destroy
      params[:notice] = "Removed Group"
    else
      prams[:error] = "Could not remove group"
    end
    redirect_to user_path(current_user)
  end
end
