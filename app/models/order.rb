class Order < ApplicationRecord
  belongs_to :user
  belongs_to :meal

  validates :user, presence: true
  validates :meal, presence: true
  validates :price, presence: true, numericality: true
  validates :status, presence: true
  validates :status, inclusion: { in: ['pending', 'delivered', 'cancelled'] }
end
