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

  def update_from_project
    if (list = List.find_by_title(params[:title]))
      list.update(project_id: params[:id])

      flash[:success] = "リストの更新に成功しました。"
      redirect_to project_path(params[:id])
    else
      flash[:danger] = "リストの更新に失敗しました。"
      redirect_to project_path(params[:id])
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
