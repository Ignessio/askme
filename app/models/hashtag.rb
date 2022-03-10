class Hashtag < ApplicationRecord
  HASHTAG_FORMAT = /#[[:word:]-]+/

  has_many :taggings, dependent: :destroy
  has_many :questions, through: :taggings

  validates :name, presence: true, uniqueness: true
end
