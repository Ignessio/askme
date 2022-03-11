class QuestionSave
  def self.call(question)
    new(question).call
  end

  def call
    question.transaction do
      question.save

      question.hashtags = "#{question.text} #{question.answer}".
        downcase.
        scan(Hashtag::HASHTAG_FORMAT).
        uniq.
        map { |hashtag| Hashtag.create_or_find_by(name: hashtag.gsub("#", "")) }
    end
  end

  private

  attr_reader :question

  def initialize(question)
    @question = question
  end
end

