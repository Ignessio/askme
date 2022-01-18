class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user.present?
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Вы успешно залогинились'
    else
      flash.now.alert = 'Не правильный email ищи пароль'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Вы разлогинились. Приходите еще!'
  end
end
