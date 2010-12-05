class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Comment created"
    else
      flash[:error] = "Comment not created"
    end
  redirect_to :back
  end
end
