class Brand < ActiveRecord::Base
  include Notificable

  validates :name, presence: true, uniqueness: true
  has_many :series, class_name: "Serie", inverse_of: :brand, dependent: :delete_all
  has_many :compared_cars, class_name: "ComparedCar", inverse_of: :brand, dependent: :delete_all

  def active_model_serializer
    BrandSerializer
  end
end
