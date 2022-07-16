class TasksController < ApplicationController
  def index
    @tasks_not_yet = Task.where(status:0)
    @tasks_done = Task.where(status:1)
  end
end