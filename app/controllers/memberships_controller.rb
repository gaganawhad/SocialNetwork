class MembershipsController < ApplicationController
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
