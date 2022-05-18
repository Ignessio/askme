class Hashtag < ApplicationRecord
  HASHTAG_FORMAT = /#[[:word:]-]+/

  has_many :taggings, dependent: :destroy
  has_many :questions, through: :taggings

  scope :with_questions, -> { where_exists(:taggings) }
end
