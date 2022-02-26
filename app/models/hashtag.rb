class Hashtag < ApplicationRecord
  HASHTAG_FORMAT = /#[[:word:]-]+/

  has_many :taggings, dependent: :destroy
  has_many :questions, through: :taggings

  before_validation :convert_to_downcase

  validates :body,
            presence: true,
            format: { with: HASHTAG_FORMAT }

  private

  def convert_to_downcase
    body&.downcase!
  end
end
