class Comment < ApplicationRecord
  belongs_to :product
  validates :commenter, presence: true
  validates :body, presence: true, length: { maximum: 50 }
end
