class Hashtag < ApplicationRecord
  HASHTAG_FORMAT = /#[[:word:]-]+/

  has_many :taggings, dependent: :destroy
  has_many :questions, through: :taggings

  before_validation :convert_to_downcase

  validates :name,
            presence: true,
            uniqueness: true,
            format: {with: HASHTAG_FORMAT}

  private

  def convert_to_downcase
    name&.downcase!
  end
end
