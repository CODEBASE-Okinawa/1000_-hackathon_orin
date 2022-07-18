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
    list = List.find_or_create_by(title: params[:title])
    if list
      list.update(project_id: params[:id])

      flash[:success] = "リストの追加に成功しました。"
      redirect_to project_path(params[:id])
    else
      flash[:danger] = "リストの追加に失敗しました。"
      redirect_to project_path(params[:id])
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
