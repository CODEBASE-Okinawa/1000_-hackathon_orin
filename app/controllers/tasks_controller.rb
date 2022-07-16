class TasksController < ApplicationController
  def index
    @tasks_not_yet = Task.where(complete: false)
    @tasks_done = Task.where(complete: true)
  end

  def new
    @task = Task.new
    render 'index'
  end

  def create
    Task.create(task_params)
    redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:title)
    end
end