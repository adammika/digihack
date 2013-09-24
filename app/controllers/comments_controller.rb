class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(params[:comment])
    @comment.commenter = current_user.name
    @comment.save

    redirect_to project_path(@project)
  end
end
