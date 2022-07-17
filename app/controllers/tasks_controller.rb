class TasksController < ApplicationController
  before_action :redirect_signin
  def index
    @task = Task.new
    @tasks_not_yet = Task.where(complete: false)
    @tasks_done = Task.where(complete: true)
  end

  def create
    @list = List.find(params[:task][:id].to_i)
    task = Task.create(
      title: params[:task][:title],
      list_id: @list.id
    )

    redirect_to list_path(@list)
  end

  def show
    @task = Task.find(params[:id])
    @comment = Comment.new
  end

  def toggle
    @task = Task.find(params[:id])
    bool = request.body.read
    merge_params(bool)
    @task.update(complete: params[:complete])
  end

  private
  def task_params
    params.require(:task).permit(:title)
  end

  def merge_params(bool)
    if bool == "false"
      params.merge!(complete: false)
    else
      params.merge!(complete: true)
    end
  end
end
