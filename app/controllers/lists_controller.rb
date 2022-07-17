class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.all
  end

  def create
    List.create(list_params)
    redirect_to lists_path
  end

  def show
    @task = Task.new
    @list = List.find(params[:id])
  end

  private
  def list_params
    params.require(:list).permit(:title)
  end
end
