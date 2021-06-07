class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :meals
  has_many :meals_ordered, through: :orders, source: :meal

  validates :first_name, presence: true
  validates :last_name, presence: true
end
