class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products
  enum status: { pending: 0, delivered: 1 }
end
