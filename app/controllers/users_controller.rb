class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Valentin',
      username: 'ignessio',
      avatar_url: 'https://ru.gravatar.com/userimage/215164627/0794f2ef04dde43deadf0f0732c316fe.png'
     )

     @questions = [
       Question.new(text: 'Какие дела?', created_at: Date.parse('16.01.2022')),
       Question.new(text: 'В чем смысл учебы?', created_at: Date.parse('16.01.2022'))
     ]

     @new_question = Question.new
  end
end
