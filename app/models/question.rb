class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :taggings, dependent: :destroy
  has_many :hashtags, through: :taggings

  validates :text, presence: true, length: { maximum: 255 }
end
