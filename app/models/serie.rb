class Serie < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :enabled, inclusion: { in: [true, false] }
  belongs_to :brand, inverse_of: :series
  has_many :car_models, class_name: "CarModel", inverse_of: :serie, dependent: :destroy
end
