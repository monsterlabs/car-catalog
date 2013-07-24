class Car < ActiveRecord::Base
  validates :modelName, :highlights, :year, :image, :presence => true
  validates :enabled, inclusion: { in: [true, false] }

  belongs_to :car_line, class_name: "CarLine", foreign_key: "carLine_id", inverse_of: :cars
  belongs_to :car_file, class_name: "CarFile", inverse_of: :car
  has_many :specifications, class_name: "Specification", inverse_of: :car, dependent: :destroy

  mount_uploader :image, ImageUploader

  def to_s
    [car_line.serie.name, car_line.name, modelName, year].join(' - ')
  end
end
