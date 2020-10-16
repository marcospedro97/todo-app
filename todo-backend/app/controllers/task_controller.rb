class TaskController < ApplicationController
  before_action :find_task, only: %i[show update destroy]

  def index
    @tasks = Task.where(project_id: params[:project_id])
    if @tasks.empty?
      raise ActiveRecord::RecordNotFound
    end
    render json: @tasks
  end

  def create
    @task = Task.create!(task_params)
    @task.project = Project.find(task_params[:project_id])
    render json: @task, status: :created
  end

  def show
    render json: @task
  end

  def update
    if @task.update(task_params)
      render json: @task, status: :accepted
    else
      render json: { error: 'Invalid Params' }, status: :bad_request
    end
  end

  def destroy
    @task.delete
    render json: { status: 'Deleted with success' }, status: :accepted
  end

  private

  def task_params
    params.permit(:name, :description, :project_id)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end