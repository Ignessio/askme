module QuestionsHelper
  def some_method
    question.hashtags = "#{question.text} #{question.answer}".
      downcase.
      scan(Hashtag::HASHTAG_FORMAT).
      uniq.
      map { |hashtag| Hashtag.create_or_find_by(name: hashtag.gsub("#", "")) }
  end
end
