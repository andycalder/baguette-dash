class Meal < ApplicationRecord
  has_one_attached :photo

  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
end
