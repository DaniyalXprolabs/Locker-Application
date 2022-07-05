class Comment < ApplicationRecord
  belongs_to :product
  validates :commenter, presence: true
  
end
