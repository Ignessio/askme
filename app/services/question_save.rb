class QuestionSave
  def self.call(question)
    new(question).call
  end

  def call
    question.transaction do
      question.save
      question_hashtag(question)
    end
  end

  def question_hashtag(question)
    question.hashtags =
      "#{question.text} #{question.answer}".
        downcase.
        scan(Hashtag::HASHTAG_FORMAT).
        uniq.
        map { |hashtag| Hashtag.create_or_find_by(name: hashtag.gsub("#", "")) }
  end

  private

  attr_reader :question

  def initialize(question)
    @question = question
  end
end
