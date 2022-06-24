class Product < ApplicationRecord
  belongs_to :user
  
  extend FriendlyId
  friendly_id :name, use: :slugged
end
