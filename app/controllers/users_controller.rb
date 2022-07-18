class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find(current_user.id)
    render 'show'
  end

  def edit
    @user = User.find(current_user.id)
    unless @user && logged_in?
      redirect_to signin_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = '更新しました。'
      redirect_to @user
    else
      flash[:danger] = '更新に失敗しました。'
      redirect_to edit_user_path
    end
  end

  def update_from_project
    user = User.find_by_email(params[:email])
    project_id = params[:id]
    if user && project_id
      UserProject.create(user_id: user.id, project_id: project_id)
      flash[:success] = "ユーザーの更新に成功しました。"
      redirect_to project_path(project_id)
    else
      flash[:danger] = "ユーザーの更新に失敗しました。"
      redirect_to project_path(project_id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
