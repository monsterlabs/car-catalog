class ComparedCar < ActiveRecord::Base
  self.table_name = "comparedcars"
  validates :modelName, :year, :presence => true
  belongs_to :brand, inverse_of: :compared_cars
  has_many :comparatives, class_name: "Comparative", foreign_key: "comparedCar_id", inverse_of: :compared_car
  mount_uploader :image, ImageUploader

  def to_s
    [brand.name, modelName, year].join(' ')
  end
end
