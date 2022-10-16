class Spot < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  mount_uploaders :images, ImageUploader
  after_validation :geocode
  geocoded_by :address
  def display_image
    images.variant(resize_to_limit: [500, 500])
  end
end
