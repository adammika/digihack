class MembershipsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @membership = @project.memberships.create(user_id: current_user.id)
    @membership.save
    
    redirect_to project_path(@project), notice: 'Successfully added as project member.'
  end

  def destroy
  	@user = User.find(params[:id])
  	@project = Project.find(params[:project_id])
  	@membership = Membership.find_by_user_id_and_project_id(@user.id, @project.id)
  	@membership.delete

  	redirect_to project_path(@project), notice: 'Successfully removed as member from project.'
  end
end
