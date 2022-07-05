class User < ApplicationRecord
  has_many :products
  has_many :orders

  enum role: { buyer: 0, seller: 1, admin: 2 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, length: {maximum: 15, minimum: 5} 
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEXP } 
  validates :phone_number, presence: true, uniqueness: true, length: { is: 11 }
  
end
