module Questions
  class Update < BaseTransaction
    step :load_question
    step :validation
    step :persistence

    def load_question(input)
      question = Question.new(author: input[:current_user], **input[:params])

      Success(input.merge(question: question))
    end

    def validation(input)
      if input[:question].valid?
        Success(input)
      else
        Failure(input)
      end
    end

    def persistence(input)
      QuestionSave.(input[:question])

      Success(input)
    end
  end
end
