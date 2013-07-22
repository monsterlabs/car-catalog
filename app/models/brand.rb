class Brand < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :series, class_name: "Serie", inverse_of: :brand, dependent: :destroy
  has_many :compared_cars, class_name: "ComparedCar", inverse_of: :brand, dependent: :destroy
end
