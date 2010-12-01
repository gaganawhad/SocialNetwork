class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  def new
    @group = Group.new
  end
  def create
    @group = Group.new(params[:group])
  end
  def edit
    @group = Group.find(params[:id])
  end
  def update
    @group = Group.find(params[:id])
    @group.update_attributes(params[:group])
  end
  def show
    @group = Group.find(params[:id])
  end
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
  end
end
