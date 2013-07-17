class Offer < ActiveRecord::Base
  validates :title, :body, :url, :validUntil, :image, :largeImage, presence: true
  validates :enabled, inclusion: { in: [true, false] }

  mount_uploader :image, OfferImageUploader
  mount_uploader :largeImage, OfferLargeImageUploader
end
