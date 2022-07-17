class ProjectsController < ApplicationController
  def index
    @project = Project.new
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "プロジェクトの作成に成功しました。"
      redirect_to project_path(@project)
    else
      flash[:danger] = "プロジェクトの作成に失敗しました。"
      redirect_to projects_path
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private
  def project_params
    params.require(:project).permit(:title)
  end
end
