class Product < ApplicationRecord
  belongs_to :user
  
  has_many :order_products
  has_many :orders, through: :order_products

  has_many :comments, dependent: :destroy

  has_one_attached :product_picture
  
  
end
