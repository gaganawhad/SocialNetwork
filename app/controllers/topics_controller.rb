class TopicsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @topic = @group.topics.build
  end
  def create
    @topic = current_user.topics.build(params[:topic])
    if @topic.save
      flash[:notice] = "Created new topic"
    else
      flash[:error] = "Could not create topic"
    end
    redirect_to group_topic_path(:group_id => params[:group_id], :id => @topic.id)
  end
  def show
    @topic = Topic.find(params[:id])
    @comment = @topic.comments.build
  end
end
