class Spot < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  
  validates :user_id, presence: true
  mount_uploaders :images, ImageUploader
  after_validation :geocode
  geocoded_by :address
  def display_image
    images.variant(resize_to_limit: [500, 500])
  end

  class << self
    def within_box(distance, latitude, longitude)
      center_point = [latitude, longitude]
      box = Geocoder::Calculations.bounding_box(center_point, distance)
      self.within_bounding_box(box)
    end
  end
end
