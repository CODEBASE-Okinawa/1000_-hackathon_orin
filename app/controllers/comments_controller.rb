class CommentsController < ApplicationController
  def create
    @task = Task.find(params[:comment][:id].to_i)
    comment = Comment.new(
      description: params[:comment][:description],
      task_id: @task.id,
      user_id: current_user.id
    )
    if comment.save
      flash[:success] = 'コメントを作成しました。'
      redirect_to task_path(@task)
    else
      flash[:danger] = 'コメントは作成できませんでした。'
      redirect_to task_path(@task)
    end
  end

  def update
  end

  def destroy
  end
end
