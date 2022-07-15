class Product < ApplicationRecord
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products
  
  has_many :order_products
  has_many :orders, through: :order_products

  has_many :comments, dependent: :destroy

  has_one_attached :product_picture
  
  validates :name, presence: true, length: { maximum:50 }
  validates :price, presence: true, numericality: { greater_than: 1 }
end
