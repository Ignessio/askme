class QuestionsController < ApplicationController
  before_action :load_question, only: %i[edit update destroy]
  before_action :authorize_user, except: [:create]

  def create
    Questions::Create.(
      params: question_create_params,
      current_user: current_user
    ) do |m|
      m.failure :validation do |result|
        @question = result[:question]
        render :edit
      end

      m.success do |result|
        redirect_to user_path(result[:question].user), notice: t('.created')
      end
    end
  end

  def edit
  end

  def update
    if @question.update(question_update_params)
      redirect_to user_path(@question.user), notice: t('.updated')
    else
      render :edit
    end
  end
  
  # def update
  #   Question::Update.(
  #     params: question_update_params,
  #     current_user: current_user
  #   ) do |m|
  #     m.failure :validation do |result|
  #       @question = result[:question]
  #       render :edit
  #     end

  #     m.success do |result|
  #       @question = result[:question]
  #       redirect_to user_path(result[:question].user), notice: t('.updated')
  #     end
  #   end
  # end

  def destroy
    user = @question.user
    @question.destroy
    redirect_to user_path(user), notice: t('.deleted')
  end

  private
  def load_question
    @question = Question.find(params[:id])
  end

  def authorize_user
    reject_user unless @question.user == current_user
  end

  def question_create_params
    params.require(:question).permit(:user_id, :text)
  end

  def question_update_params
    params.require(:question).permit(:answer)
  end
end
