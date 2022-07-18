class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'ログインに成功しました。'
      redirect_to profile_path
    else
      flash[:danger] = 'メールアドレス、またはパスワードが違います。'
      redirect_to signin_path
    end
  end

  def destroy
    log_out
    redirect_to signin_path
  end
end
