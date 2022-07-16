class TasksController < ApplicationController
  def index
    @tasks_not_yet = Task.where(complete: false)
    @tasks_done = Task.where(complete: true)
  end
end