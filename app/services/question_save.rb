class QuestionSave
  def self.call(question)
    new(question).call
  end

  def call
    question.transaction do
      question.save
    end
  end

  private

  attr_reader :question

  def initialize(question)
    @question = question
  end
end
