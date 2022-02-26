class Tagging < ApplicationRecord
  belongs_to :question
  belongs_to :hashtag
end
