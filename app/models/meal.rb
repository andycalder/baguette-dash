class Meal < ApplicationRecord
  has_one_attached :photo

  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true

  # Add geocode to address
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def display_photo
    photo.attached? ? cl_image_path(photo.key) : ActionController::Base.helpers.image_path("baguettes.jpeg", digest: false)
  end
end
