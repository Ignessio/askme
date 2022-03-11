class HashtagsController < ApplicationController
  def show
    hashtag = Hashtag.with_questions.find_by!(name: params[:name])
    @questions = hashtag.questions
  end
end
