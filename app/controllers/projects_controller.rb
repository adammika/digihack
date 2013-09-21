class ProjectsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @project.user = current_user
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
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
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    
    redirect_to projects_url
  end
end
