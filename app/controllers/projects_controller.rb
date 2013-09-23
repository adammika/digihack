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
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  def create
    @project = Project.new(params[:project])
    @project.creator = current_user

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /projects/1
  def update
    @project = Project.find(params[:id])

    if @project.creator != current_user
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

    # if @project.creator != current_user
    #   flash[:notice] = 'That project is not yours to delete'
    #   redirect_to :back
    # else
      @project.destroy
      redirect_to projects_url
    # end
  end
end
