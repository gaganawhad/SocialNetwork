class TopicsController < ApplicationController
  def show
    @topic = Topic.find(params[:id])
    @comment = @topic.comments.build
  end
end
