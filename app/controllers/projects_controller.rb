class ProjectsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /projects
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /projects/1
  def show
    @project = Project.find(params[:id])
    logger.debug "Project user: #{@project.user}"
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.user = current_user
    @project.save
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  def create
    @project = Project.new(params[:project])

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /projects/1
  def update
    @project = Project.find(params[:id])

    if @project.user != current_user
      redirect_to @project, notice: 'This project is not yours to edit.'
    elsif @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /projects/1
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    
    redirect_to projects_url
  end
end
