class Meal < ApplicationRecord
  has_one_attached :photo

  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :address, presence: true

  # Add geocode to address
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [:name, :description],
    using: {
      tsearch: { prefix: true }
    }
end
