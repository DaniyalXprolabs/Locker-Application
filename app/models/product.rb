class Product < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_one_attached :product_picture
  
  extend FriendlyId
  friendly_id :name, use: :slugged
end
