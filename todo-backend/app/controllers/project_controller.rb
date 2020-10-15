class ProjectController < ApplicationController
  before_action :find_project, only: %i[show update destroy]

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    render json: @project
  end

  def create
    @project = Project.create!(project_params)
    render json: @project, status: :created
  end

  def update
    if @project.update(project_params)
      render json: @project, status: :accepted
    else
      render json: { error: 'Invalid Params' }, status: :bad_request
    end
  end

  def destroy
    @project.delete
    render json: { status: 'Deleted with success' }, status: :accepted
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.permit(:name)
  end
end
