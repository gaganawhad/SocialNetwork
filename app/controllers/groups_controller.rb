class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  def new
    @group = Group.new
  end
  def create
    @group = Group.new(params[:group])
    @group.memberships.build(:user_id => current_user.id, :owner => true, :admin => true)
    if @group.save
      flash[:notice] = "Group created successfully"
    else
      flash[:error] = "Group not created"
    end
    redirect_to group_path(@group)
  end
  def edit
    @group = Group.find(params[:id])
  end
  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      flash[:notice] = "Group updated successfully"
    else
      flash[:error] = "Group not updated"
    end
    redirect_to group_path(@group)
  end
  def show
    @group = Group.find(params[:id])
  end
  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      flash[:notice] = "Group updated successfully"
    else
      flash[:error] = "Group not updated"
    end
    redirect_to :back
  end
end
