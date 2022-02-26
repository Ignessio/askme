class Question < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :hashtags, through: :taggings

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  validates :text, presence: true, length: { maximum: 255 }
end
