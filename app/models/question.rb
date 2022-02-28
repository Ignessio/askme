class Question < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :hashtags, through: :taggings

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  after_commit :create_hashtags, on: %i[create update]

  validates :text, presence: true, length: { maximum: 255 }

  def question_text_only
    "#{text} #{answer}"
  end

  def find_hashtags
    question_text_only.scan(Hashtag::HASHTAG_FORMAT).map{|name| name.gsub("#", "")}
  end

  def create_hashtags
    find_hashtags.each do |name|
      hashtags.create(name: name)
    end
  end
end
