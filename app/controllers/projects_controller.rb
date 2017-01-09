class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    3.times { @project.people.build}
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @project = Project.find_by(id: params[:id])
    #@project.people.build
  end

  def update
    @project = Project.find_by(id: params[:id])
    if @project.update_attributes(project_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, people_attributes: [:id, :name, :email, :_destroy])
  end
end

