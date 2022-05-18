class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :taggings, dependent: :destroy
  has_many :hashtags, through: :taggings

  scope :answered, -> { where.not(answer: nil) }
  scope :unanswered, -> { where(answer: nil) }

  after_commit :create_hashtag, on: %i[create update]

  validates :text, presence: true, length: { maximum: 255 }

  def create_hashtag
    self.hashtags = "#{text} #{answer}".
      downcase.
      scan(Hashtag::HASHTAG_FORMAT).
      uniq.
      map{ |hashtag| Hashtag.create_or_find_by(name: hashtag.delete("#")) }
  end
end
