class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items
  enum status: { pending: 0, delivered: 1 }
  accepts_nested_attributes_for :order_items 
end
