class CarFile < ActiveRecord::Base
  validates :xls, :image, presence: true
  validates :imported, inclusion: { in: [true, false] }
  has_one :car, class_name: "Car", inverse_of: :car_file
  mount_uploader :image, ImageUploader
  mount_uploader :xls, DocumentUploader

  def to_s
    [serie, model, line, year].join(' ')
  end
end
