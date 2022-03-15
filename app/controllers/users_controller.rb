class UsersController < ApplicationController
  before_action :load_user, except: %i[index new create]
  before_action :authorize_user, except: %i[index new create show]

  def index
    @users = User.all
    @hashtags = Hashtag.with_questions
  end

  def new
    redirect_to root_path, alert: t('.signed_in') if current_user.present?
    @user = User.new
  end

  def create
    redirect_to root_path, alert: t('.signed_in') if current_user.present?
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: t('.signed_up')
    else
      render 'new'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, alert: t('.deleted')
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: t('.updated')
    else
      render 'edit'
    end
  end

  def show
    @questions = @user.questions.order(created_at: :desc)
    @new_question = @user.questions.build

    @questions_count = @questions.count
    @answered_count = @questions.answered.count
    @unanswered_count = @questions.unanswered.count
end

  private

  def authorize_user
    reject_user unless @user == current_user
  end

  def load_user
    @user ||= User.find params[:id]
  end

  def user_params
    params.require(:user).
      permit(
        :email,
        :password,
        :password_confirmation,
        :name,
        :username,
        :avatar_url,
        :color
      )
  end
end
