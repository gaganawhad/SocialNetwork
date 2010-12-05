class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = "Comment created"
    else
      flash[:error] = "Comment not created"
    end
  redirect_to :back
  end
end
